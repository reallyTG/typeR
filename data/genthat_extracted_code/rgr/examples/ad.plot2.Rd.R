library(rgr)


### Name: ad.plot2
### Title: Plot Results of Analytical Duplicate Analyses, Alternate Input
### Aliases: ad.plot2
### Keywords: univar hplot

### ** Examples

## Make test data available
data(ad.test)
attach(ad.test)

## Plot analytical duplicate analyses as a time-series
ad.plot2(Cu, ifalt = TRUE)

## Plot analytical duplicate analyses versus duplicate means,
## annotating more appropriately, with a 20% maximum tolerance
ad.plot2(Cu, "Cu (mg/kg)", if.order = FALSE, ad.tol = 20, ifalt = TRUE)

## Detach test data
detach(ad.test)



