library(Thermimage)


### Name: readflirJPG
### Title: Reads an image from a FLIR JPG file into an integer array.
### Aliases: readflirJPG

### ** Examples


## Not run: 
##D ## Example using the flirsettings and readflirjpg functions
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
##D ## Set variables for calculation of temperature values from raw A/D sensor data  ####
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
##D ## Import image from flir jpg to obtain binary data
##D img<-readflirJPG(imagefile)
##D 
##D ## Rotate image before plotting
##D imgr<-rotate270.matrix(img)
##D 
##D ## Plot initial image of raw binary data
##D library(fields)
##D image.plot(imgr, useRaster=TRUE, col=ironbowpal)
##D 
##D ## Convert binary data to temperature
##D 
##D ## Consider whether you should change any of the following: 
##D ## ObjectEmissivity, OD, RH, ReflT, AtmosT, IRWinT, IRWinTran
##D 
##D temperature<-raw2temp(imgr,ObjectEmissivity,OD,ReflT,AtmosT,IRWinT,IRWinTran,RH,
##D                       PlanckR1,PlanckB,PlanckF,PlanckO,PlanckR2)
##D colnames(temperature)<-NULL
##D rownames(temperature)<-NULL
##D 
##D ## Plot temperature image using fields package
##D t<-temperature
##D image.plot(t, asp=h/w, bty="n", useRaster=TRUE, xaxt="n", yaxt="n", col=ironbowpal)
##D 
##D ## Plot temperature image using ggplot2
##D library(ggplot2)
##D library(reshape2)
##D d<-melt(temperature)
##D 
##D p<-ggplot(d, aes(Var1, Var2))+
##D   geom_raster(aes(fill=value))+coord_fixed()+
##D   scale_fill_gradientn(colours=ironbowpal)+
##D   theme_void()+
##D   theme(legend.key.height=unit(2, "cm"), legend.key.width=unit(0.5, "cm"))
##D p
##D 
##D 
##D ## Export Temperature Data to CSV file
##D ## Must rotate image 90 degrees before exporting
##D ## This csv file can be imported into imageJ (File-Import-Text Image) for open source image
##D ## analysis options of accurate thermal image data.  If you have many csv files, consider
##D ## writing a macro, see:
##D ## http://imagej.1557.x6.nabble.com/open-text-image-sequence-td4999149.html
##D 
##D 
##D f.temperature<-"IR_2412.csv"
##D write.csv(rotate90.matrix(temperature), f.temperature, row.names=FALSE)
##D 
## End(Not run)

## See also https://github.com/gtatters/Thermimage/README.md




