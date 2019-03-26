library(polySegratio)


### Name: plot.segRatio
### Title: Plot segregation ratios for either observed or simulated marker
###   data
### Aliases: plot.segRatio plot.simAutoMarkers plot.simAutoCross
### Keywords: manip

### ** Examples


## generate some autooctoploid data
a <- sim.autoMarkers(8,c(0.7,0.2,0.09,0.01))

## print markers and plot segratios
print(a)
plot(a$seg.ratios)  # plot the segregation ratios directly
plot(a)             # plot the simAutoMarkers object

## add some missing values and plot all histograms
plot(addMissing(a,0.2)$seg.ratios, type="all")



