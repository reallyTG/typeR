library(bayeslongitudinal)


### Name: mharma11
### Title: mharma11
### Aliases: mharma11

### ** Examples

attach(Dental)
Y=as.vector(distance)
X=as.matrix(cbind(1,age))
mharma11(Y,X,27,4,c(1,1),0.5,0.5,1,1,1,1,500,50)



