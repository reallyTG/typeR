library(funcy)


### Name: dist2centers
### Title: Calculates curve distances to the centers.
### Aliases: dist2centers

### ** Examples

##Generate dataset
set.seed(2804)
ds <- sampleFuncy(obsNr=100, k=4, timeNrMin=5, timeNrMax=10, reg=FALSE)
data <- Data(ds)
##Get unique union of all time points
time <- sort(unique(data[,3]))
##Generate center curves
c1 <- sin(time)+rnorm(30)
c2 <- cos(time)+rnorm(30)
c3 <- time^2+rnorm(3)
centers <- cbind(c1,c2,c3)
##Calculate distance to the centers
dist2centers(data, centers)



