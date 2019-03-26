library(bayeslongitudinal)


### Name: mhsc
### Title: mhsc
### Aliases: mhsc

### ** Examples

attach(Dental)
Y=as.vector(distance)
X=as.matrix(cbind(1,age))
mhsc(Y,X,27,4,c(1,1),0.5,1,1,500,50)



