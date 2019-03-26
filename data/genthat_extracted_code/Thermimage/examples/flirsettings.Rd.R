library(Thermimage)


### Name: flirsettings
### Title: Extracts meta tag information from a FLIR JPG image
### Aliases: flirsettings

### ** Examples

## Not run: 
##D ## To access meta-tag information from a flir jpg or flir file:
##D 
##D ## Example using the flirsettings functions:
##D 
##D library(Thermimage)
##D ## Sample flir jpg included with Thermimage package:
##D 
##D imagefile<-paste0(system.file("extdata/IR_2412.jpg", package="Thermimage"))
##D 
##D ## Extract meta-tags from thermal image file ##
##D cams<-flirsettings(imagefile, exiftool="installed", camvals="")
##D cams
##D 
##D ## Set variables for calculation of temperature values from raw A/D sensor data
##D Emissivity<-cams$Info$Emissivity      # Image Saved Emissivity - should be ~0.95 or 0.96
##D ObjectEmissivity<-0.96                # Object Emissivity - should be ~0.95 or 0.96
##D dateOriginal<-cams$Dates$DateTimeOriginal
##D dateModif<-   cams$Dates$FileModificationDateTime
##D PlanckR1<-    cams$Info$PlanckR1                      # Planck R1 constant for camera  
##D PlanckB<-     cams$Info$PlanckB                       # Planck B constant for camera  
##D PlanckF<-     cams$Info$PlanckF                       # Planck F constant for camera
##D PlanckO<-     cams$Info$PlanckO                       # Planck O constant for camera
##D PlanckR2<-    cams$Info$PlanckR2                      # Planck R2 constant for camera
##D OD<-          cams$Info$ObjectDistance                # object distance in metres
##D FD<-          cams$Info$FocusDistance                 # focus distance in metres
##D ReflT<-       cams$Info$ReflectedApparentTemperature  # Reflected apparent temperature
##D AtmosT<-      cams$Info$AtmosphericTemperature        # Atmospheric temperature
##D IRWinT<-      cams$Info$IRWindowTemperature           # IR Window Temperature
##D IRWinTran<-   cams$Info$IRWindowTransmission          # IR Window transparency
##D RH<-          cams$Info$RelativeHumidity              # Relative Humidity
##D h<-           cams$Info$RawThermalImageHeight         # sensor height (i.e. image height)
##D w<-           cams$Info$RawThermalImageWidth          # sensor width (i.e. image width)
##D 
##D ## See also https://github.com/gtatters/Thermimage/README.md
## End(Not run)





