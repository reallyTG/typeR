library(MixtureInf)


### Name: earthquake
### Title: number of earthquakes
### Aliases: earthquake
### Keywords: datasets

### ** Examples

#fit a finite Poisson mixture model of order 2 to this data set,
#plot the histogram of the observations and the fitted probability mass function.
data(earthquake)
out <- pmle.pois(earthquake,2,1)
plotmix.pois(earthquake,out)



