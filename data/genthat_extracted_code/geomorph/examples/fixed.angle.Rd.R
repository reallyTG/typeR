library(geomorph)


### Name: fixed.angle
### Title: Rotate a subset of 2D landmarks to common articulation angle
### Aliases: fixed.angle
### Keywords: utilities

### ** Examples

#Example using Plethodon
#Articulation point is landmark 1, rotate mandibular landmarks (2-5) relative to cranium

data(plethspecies) 
fixed.angle(plethspecies$land,art.pt=1,angle.pts=c(5,6),rot.pts=c(2,3,4,5))



