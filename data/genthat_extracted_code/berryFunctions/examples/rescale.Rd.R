library(berryFunctions)


### Name: rescale
### Title: shift and scale a vector
### Aliases: rescale
### Keywords: manip

### ** Examples


rescale(10:15, 135, 200)
rescale(10:15, 200, 135)
rescale(10:15, to=c(1,5))

values <- rbeta(1e3, shape1=4, shape2=35)
hist(rescale(values, 135, 200), breaks=25, col=3)




