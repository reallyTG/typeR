library(ordinal)


### Name: ordinal-package
### Title: Regression Models for Ordinal Data via Cumulative Link (Mixed)
###   Models
### Aliases: ordinal-package ordinal
### Keywords: package

### ** Examples


## A simple cumulative link model:
fm1 <- clm(rating ~ contact + temp, data=wine)
summary(fm1)

## A simple cumulative link mixed model:
fmm1 <- clmm(rating ~ contact + temp + (1|judge), data=wine)
summary(fmm1)




