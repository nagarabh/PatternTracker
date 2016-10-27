LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
OPENCV_CAMERA_MODULES:=on
OPENCV_INSTALL_MODULES:=on
include C:/Software/Android/OpenCV-2.4.9-android-sdk/sdk/native/jni/OpenCV.mk

SRC_PATH := src

LOCAL_CFLAGS    += -I$(SRC_PATH) -g -Wno-deprecated-declarations
LOCAL_CFLAGS    += -DSHOW_REFERENCE_PROGRESS=1
LOCAL_CFLAGS += -fopenmp
LOCAL_LDFLAGS += -fopenmp
LOCAL_MODULE    := cgt
LOCAL_SRC_FILES := cgt.cpp \
	$(SRC_PATH)/util.cpp \
	$(SRC_PATH)/CLManager.cpp \
	$(SRC_PATH)/CLTracker.cpp

LOCAL_LDLIBS := -landroid -llog -ljnigraphics $(LOCAL_PATH)/libs/gs6/libOpenCL.so $(LOCAL_PATH)/libs/gs6/libEGL.so
LOCAL_STATIC_LIBRARIES := android_native_app_glue

include $(BUILD_SHARED_LIBRARY)
$(call import-module,android/native_app_glue)