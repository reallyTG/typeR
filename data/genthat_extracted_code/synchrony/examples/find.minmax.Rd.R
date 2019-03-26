library(synchrony)


### Name: find.minmax
### Title: Find min/max of a time series
### Aliases: find.minmax
### Keywords: max min

### ** Examples

t1=runif(100)
min.max=find.minmax(t1)
min.max$maxs
plot (t1, t="l")
points (min.max$mins, col="blue", bg="blue", pch=19)
points (min.max$maxs, col="red", bg="red", pch=19)



