library(satellite)


### Name: satInfo
### Title: Get or access Satellite object information used by various
###   functions
### Aliases: satInfo getSatDataLayers getSatDataLayer getSatMeta
###   getSatMetaBCDETemplate getSatLog setSatBCDE createSatBCDE
###   addSatMetaParam addSatMetaEntry addSatLog addSatDataLayer
###   addRasterMeta2Sat createRasterMetaData updateRasterMetaData
###   countSatDataLayers getSatParam getSatBCDE getSatBID getSatSID
###   getSatSensor getSatSensorGroup getSatSensorInfo getSatSpectrum
###   getSatBCDESolar getSatBCDEThermal getSatXRes getSatYRes getSatRes
###   getSatType getSatCalib getSatBCDEType getSatBCDEFromType
###   getSatBCDEFromSpectrum getSatBCDESres getSatBCDECalib
###   getSatBCDESolarCalib getSatBCDEThermalCalib getSatBandInfo
###   getSatRadMax getSatRadMin getSatRefMax getSatRefMin getSatESD
###   getSatESUN getSatSZEN getSatSAZM getSatSELV getSatMetaLayer
###   getSatLayerfromData getSatLNBR getSatLMIN getSatLMAX getSatRADA
###   getSatRADM getSatREFA getSatREFM getSatBTK1 getSatBTK2 getSatPRAD
###   getSatDATE getSatProjection

### ** Examples

# List of input files
path <- system.file("extdata", package = "satellite")
files <- list.files(path, pattern = glob2rx("LC08*.TIF"), full.names = TRUE)
sat <- satellite(files)

# Raster stack l8
sat <- satellite(l8)




