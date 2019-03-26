library(SpatEntropy)


### Name: shannonX
### Title: Shannon's entropy.
### Aliases: shannonX

### ** Examples

#NON SPATIAL DATA
shannonX(sample(1:5, 50, replace=TRUE))

#POINT DATA
data.pp=runifpoint(100, win=square(10))
marks(data.pp)=sample(c("a","b","c"), 100, replace=TRUE)
shannonX(marks(data.pp))

#LATTICE DATA
data.lat=matrix(sample(c("a","b","c"), 100, replace=TRUE), nrow=10)
shannonX(data.lat)




