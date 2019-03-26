library(rgr)


### Name: ad.plot4
### Title: Plot Results of Analytical Duplicate Analyses as Ratios,
###   Alternate Input
### Aliases: ad.plot4
### Keywords: univar htest hplot

### ** Examples

## Make test data available
data(ad.test)
attach(ad.test)

## Plot analytical duplicate analyses as ratios in acquistion sequence
ad.plot4(Cu, ifalt = TRUE)

## Plot analytical duplicate analysis ratios against their means with
## more informative annotation
ad.plot4(Cu, "Cu (mg/kg)", ifalt = TRUE, if.order = FALSE)

## Plot analytical duplicate analysis ratios against their means with a
## CPP of the ratios and more informative annotation
ad.plot4(Cu, "Cu (mg/kg)", ifalt = TRUE, if.order = FALSE, if.cpp = TRUE)

## Detach test data
detach(ad.test)



