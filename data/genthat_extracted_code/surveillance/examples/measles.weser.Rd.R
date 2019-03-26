library(surveillance)


### Name: measles.weser
### Title: Measles in the Weser-Ems region of Lower Saxony, Germany,
###   2001-2002
### Aliases: measles.weser measlesWeserEms
### Keywords: datasets

### ** Examples

## old "disProg" object
data("measles.weser")
measles.weser
plot(measles.weser, as.one=FALSE)

## new "sts" object (with corrections)
data("measlesWeserEms")
measlesWeserEms
plot(measlesWeserEms)



