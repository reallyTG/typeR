library(secr)


### Name: detector
### Title: Detector Type
### Aliases: detector detector<- polygon polygonX transect transectX single
###   multi proximity count capped
### Keywords: models

### ** Examples

## Default detector type is "multi"
temptrap <- make.grid(nx = 6, ny = 8)
detector(temptrap) <- "proximity"
summary(temptrap)



