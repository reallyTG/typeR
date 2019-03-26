library(bayess)


### Name: normaldata
### Title: Normal dataset
### Aliases: normaldata
### Keywords: datasets Michelson-Morley experiment

### ** Examples

data(normaldata)
shift=matrix(normaldata,ncol=2,byrow=TRUE)[,2]
hist(shift[[1]],nclass=10,col="steelblue",prob=TRUE,main="")



