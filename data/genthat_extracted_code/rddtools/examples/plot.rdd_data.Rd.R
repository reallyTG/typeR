library(rddtools)


### Name: plot.rdd_data
### Title: Plot rdd_data
### Aliases: plot.rdd_data

### ** Examples

data(house)
house_rdd <- rdd_data(y=house$y, x=house$x, cutpoint=0)
plot(house_rdd)

## Specify manually the bandwidth:
plot(house_rdd, h=0.2)

## Show three plots with different bandwidth:
plot(house_rdd, h=c(0.2,0.3,0.4), nplot=3)

## Specify instead of the bandwidth, the final number of bins:
plot(house_rdd, nbins=22)

## If the specified number of bins is odd, the larger number is given to side with largest range
plot(house_rdd, nbins=21)



