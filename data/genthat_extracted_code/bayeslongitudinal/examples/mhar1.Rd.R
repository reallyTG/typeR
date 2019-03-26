library(bayeslongitudinal)


### Name: mhar1
### Title: mhar1
### Aliases: mhar1

### ** Examples

attach(Dental)
Y=as.vector(distance)
X=as.matrix(cbind(1,age))
mhar1(Y,X,27,4,c(1,1),0.5,1,1,500,50)



