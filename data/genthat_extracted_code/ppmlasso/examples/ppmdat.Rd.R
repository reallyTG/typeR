library(ppmlasso)


### Name: ppmdat
### Title: Prepare data for model fitting
### Aliases: ppmdat
### Keywords: Quadrature

### ** Examples

data(BlueMountains)
species.ppm = ppmdat(sp.xy = BlueMountains$eucalypt, back.xy = BlueMountains$env, 
sp.scale = 1, file.name = "Sp PPM Data")



