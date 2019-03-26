library(gstat)


### Name: vgmArea
### Title: point-point, point-area or area-area semivariance
### Aliases: vgmArea
### Keywords: models

### ** Examples

library(sp)
demo(meuse, ask = FALSE, echo = FALSE)
vgmArea(meuse[1:5,], vgm = vgm(1, "Exp", 1000)) # point-point
vgmArea(meuse[1:5,], meuse.area, vgm = vgm(1, "Exp", 1000)) # point-area



