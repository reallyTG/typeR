library(satellite)


### Name: calcAtmosCorr
### Title: Atmospheric correction of remote sensing data
### Aliases: calcAtmosCorr calcAtmosCorr,Satellite-method
###   calcAtmosCorr,RasterStack-method calcAtmosCorr,RasterLayer-method

### ** Examples

path <- system.file("extdata", package = "satellite")
files <- list.files(path, pattern = glob2rx("LC08*.TIF"), full.names = TRUE)
sat <- satellite(files)
sat_atmos <- calcAtmosCorr(sat, model = "DOS2", esun_method = "RadRef")

bcde <- "B002n"

sat <- calcTOAIrradRadRef(sat, normalize = FALSE)

path_rad <- calcPathRadDOS(x = min(getValues(getSatDataLayer(sat, bcde))),
                           bnbr = getSatLNBR(sat, bcde),
                           band_wls = 
                             data.frame(LMIN = 
                                          getSatLMIN(sat, 
                                                     getSatBCDESolar(sat)), 
                                        LMAX = 
                                          getSatLMAX(sat, 
                                                     getSatBCDESolar(sat))),
                           radm = getSatRADM(sat, getSatBCDESolar(sat)),
                           rada = getSatRADA(sat, getSatBCDESolar(sat)),
                           szen = getSatSZEN(sat, getSatBCDESolar(sat)),
                           esun = getSatESUN(sat, getSatBCDESolar(sat)),
                           model = "DOS2")

sensor_rad <- convSC2Rad(x = getSatDataLayer(sat, bcde), 
                         mult = getSatRADM(sat, bcde), 
                         add = getSatRADA(sat, bcde), getSatSZEN(sat, bcde))

ref_atmos <- calcAtmosCorr(x = sensor_rad,
                           path_rad = path_rad[names(path_rad) == bcde],
                           esun = getSatESUN(sat, bcde),
                           szen = getSatSZEN(sat, bcde), 
                           model = "DOS2")
                           



