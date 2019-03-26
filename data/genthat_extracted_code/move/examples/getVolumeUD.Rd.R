library(move)


### Name: getVolumeUD
### Title: Modify a UD raster
### Aliases: getVolumeUD getVolumeUD,.UD-method getVolumeUD,.UDStack-method

### ** Examples

data(leroydbbmm)
data(dbbmmstack)
data(leroydbgb)
getVolumeUD(leroydbbmm) # for a DBBMM object
getVolumeUD(dbbmmstack) # for a DBBMMStack object 
getVolumeUD(leroydbgb) # for a dynBGB object 

getVolumeUD(leroydbbmm, leroydbgb) # for several objects 

plot(getVolumeUD(leroydbbmm))

## e.g. select the raster corresponding to the 95% UD
leroyUD <- getVolumeUD(leroydbbmm)
leroyUD[leroyUD>0.95] <- NA
plot(leroyUD)




