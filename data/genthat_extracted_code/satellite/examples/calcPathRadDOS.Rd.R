library(satellite)


### Name: calcPathRadDOS
### Title: Compute path radiance based on the dark object method
### Aliases: calcPathRadDOS calcPathRadDOS,Satellite-method
###   calcPathRadDOS,numeric-method

### ** Examples

path <- system.file("extdata", package = "satellite")
files <- list.files(path, pattern = glob2rx("LC08*.TIF"), full.names = TRUE)
sat <- satellite(files)
sat <- calcTOAIrradModel(sat)

bds <- "B002n"
val <- calcPathRadDOS(x = min(getValues(getSatDataLayer(sat, bds))),
                      bnbr = getSatLNBR(sat, bds),
                      band_wls = data.frame(LMIN = getSatLMIN(sat, getSatBCDESolar(sat)),
                                            LMAX = getSatLMAX(sat, getSatBCDESolar(sat))),
                      radm = getSatRADM(sat, getSatBCDESolar(sat)),
                      rada = getSatRADA(sat, getSatBCDESolar(sat)),
                      szen = getSatSZEN(sat, getSatBCDESolar(sat)),
                      esun = getSatESUN(sat, getSatBCDESolar(sat)),
                      model = "DOS2",
                      scat_coef = -4)
val



