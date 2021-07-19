#
# Copyright (C) 2017 The LineageOS Open Source Project
# Copyright (C) 2018-2021 Project-LegionOS
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit some common AospExtended stuff.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

# Inherit LegionOS product configuration
$(call inherit-product, vendor/legion/config/common_full_phone.mk)

# Device
$(call inherit-product, device/motorola/lake/device.mk)

# A/B updater
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    system \
    vendor

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script \
    update_engine \
    update_engine_sideload \
    update_verifier

# The following modules are included in debuggable builds only.
PRODUCT_PACKAGES_DEBUG += \
    bootctl \
    update_engine_client

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl.recovery \
    bootctrl.sdm660 \
    bootctrl.sdm660.recovery

# Recovery
TARGET_RECOVERY_FSTAB := device/motorola/sdm660-common/rootdir/etc/fstab.qcom

# LegionOS Device Maintainers
PRODUCT_PROPERTY_OVERRIDES += \
    ro.maintainer.name=VitorSSSouza

#Boot Animation Resolution
TARGET_BOOT_ANIMATION_RES := 1080

#Play bold Play wild
LEGION_BUILD_TYPE := OFFICIAL

#Gapps Architecture
TARGET_GAPPS_ARCH := arm64

# Device identifiers
PRODUCT_DEVICE := lake
PRODUCT_NAME := legion_lake
PRODUCT_BRAND := motorola
PRODUCT_MODEL := Moto G7 Plus
PRODUCT_MANUFACTURER := Motorola
PRODUCT_RELEASE_NAME := lake

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=lake \
    PRIVATE_BUILD_DESC="lake-user 10 QPWS30.61-21-18-7 fac4a release-keys"

BUILD_FINGERPRINT := motorola/lake_retail/lake:10/QPWS30.61-21-18-7/fac4a:user/release-keys
