LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES += demo/dma_buf_mmap_demo.cpp \
			demo/gbm_es2_demo.cpp \
			demo/main.cpp \
			ged_lib/drm_modesetter.cpp \
			ged_lib/egl_drm_glue.cpp \
			ged_lib/matrix.cpp 	

LOCAL_CPPFLAGS := -DNDEBUG \
				  -DINCLUDE_ALL_METRICS \
				  -O2 -D_FORTIFY_SOURCE=2 -Wformat \
				  -fdiagnostics-color=auto  \
				  -fstack-protector \
				  -Wno-unused \
				  -Werror \
				  -Wno-strict-aliasing \
				  -Wno-unknown-pragmas \
				  -Wno-comment \
				  -msse \
				  -Wformat-security \
				  -DMD_USE_PERF \
				  -DOGL_GEM \
				  -DMETRICS_DISCOVERY \
				  -fno-inline \
				  -Wall \
				  -Wno-reorder \
                                  -Wno-error=overloaded-virtual \
				  -Wno-error=missing-field-initializers \
                                  -Wno-error=unused-parameter \
                                  -Wno-error=missing-braces \
                                  -Wno-error=unused-variable \
                                  -Wno-implicit-fallthrough \
                                  -Wno-implicit-fallthrough \
				  -std=c++11 \
				  $(DRM_CFLAGS) \
        			  $(GBM_CFLAGS) \
        			  $(EGL_CFLAGS) \
        			  $(GLES2_CFLAGS)

LOCAL_LDFLAGS :=  -Wl,--no-undefined \
				  -Wl,-z,defs \
				  -Wl,-z,noexecstack \
				  -Wl,-z,relro \
				  -Wl,-z,now

LOCAL_C_INCLUDES := $(LOCAL_PATH)/demo/ \
			$(LOCAL_PATH)/ged_lib \
			hardware/intel/external/drm-intel/include/drm \
			hardware/intel/external/drm-intel \
			hardware/intel/external/minigbm-intel

LOCAL_SHARED_LIBRARIES :=  libEGL \
				libGLESv2

LOCAL_STATIC_LIBRARIES := libdrm_pri libminigbm

LOCAL_MODULE := gbm_es2_demo 
LOCAL_PROPRIETARY_MODULE := true

include $(BUILD_EXECUTABLE)
