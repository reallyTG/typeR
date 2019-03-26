library(SpatEntropy)


### Name: shannonX_sq
### Title: Shannon's entropy with a squared information function.
### Aliases: shannonX_sq

### ** Examples

#NON SPATIAL DATA
shannonX_sq(sample(1:5, 50, replace=TRUE))

#POINT DATA
data.pp=runifpoint(100, win=square(10))
marks(data.pp)=sample(c("a","b","c"), 100, replace=TRUE)
shannonX_sq(marks(data.pp))

#LATTICE DATA
data.lat=matrix(sample(c("a","b","c"), 100, replace=TRUE), nrow=10)
shannonX_sq(data.lat)




