library(SpatEntropy)


### Name: shannonZ
### Title: Shannon's entropy of the transformed variable Z.
### Aliases: shannonZ

### ** Examples

#NON SPATIAL DATA
shannonZ(sample(1:5, 50, replace=TRUE))

#POINT DATA
data.pp=runifpoint(100, win=square(10))
marks(data.pp)=sample(c("a","b","c"), 100, replace=TRUE)
shannonZ(marks(data.pp))

#LATTICE DATA
data.lat=matrix(sample(c("a","b","c"), 100, replace=TRUE), nrow=10)
shannonZ(data.lat)

#when categories are missing
shannonZ(data.lat, missing.cat=c("d", "e"))




