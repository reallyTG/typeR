library(adlift)


### Name: Rmatsolve
### Title: Rmatsolve
### Aliases: Rmatsolve
### Keywords: array

### ** Examples

#
#create a 4x4 matrix
m<-matrix(runif(16),4,4)

temp<-crossprod(m)

#i.e. temp is t(m)%*%m

inv<-Rmatsolve(temp)




