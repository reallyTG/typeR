library(ppmlasso)


### Name: point.interactions
### Title: Calculate point interactions for area-interaction models
### Aliases: point.interactions
### Keywords: Area-interaction models

### ** Examples

data(BlueMountains)
species.ppm = ppmdat(sp.xy = BlueMountains$eucalypt, back.xy = BlueMountains$env, 
sp.scale = 1, file.name = "Sp PPM Data") # generate design matrix
species.int = point.interactions(species.ppm, 2, BlueMountains$availability)



