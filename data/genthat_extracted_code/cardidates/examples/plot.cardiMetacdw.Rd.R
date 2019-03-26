library(cardidates)


### Name: plot.cardiMetacdw
### Title: Plot Method for cardiPeakwindow Objects
### Aliases: plot.cardiMetacdw
### Keywords: hplot methods

### ** Examples

## artificial test data
data(carditest)

## identify all peaks
tt <- metaCDW(carditest)

## plot it;
plot(tt, carditest)

## or with alternate layout:
plot(tt, carditest, layout = c(1, 3))

## plot polygons
plot(tt, carditest, type = "polygon")



