library(popbio)


### Name: lambda
### Title: Population growth rate
### Aliases: lambda
### Keywords: survey

### ** Examples

A<-matrix(c(0,0,2,.3,0,0,0,.6,0), nrow=3,byrow=TRUE)
lambda(A)
# third
Re(eigen(A)$values)

data(hudsonia)
sapply(hudsonia, lambda)






