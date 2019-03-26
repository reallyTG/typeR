library(SpatEntropy)


### Name: shannonZ_sq
### Title: Shannon's entropy of Z with a squared information function.
### Aliases: shannonZ_sq

### ** Examples

#NON SPATIAL DATA
shZ=shannonZ(sample(1:5, 50, replace=TRUE))
shannonZ_sq(shZ)

#POINT DATA
data.pp=runifpoint(100, win=square(10))
marks(data.pp)=sample(c("a","b","c"), 100, replace=TRUE)
shZ=shannonZ(marks(data.pp))
shannonZ_sq(shZ)

#LATTICE DATA
data.lat=matrix(sample(c("a","b","c"), 100, replace=TRUE), nrow=10)
shZ=shannonZ(data.lat)
shannonZ_sq(shZ)




