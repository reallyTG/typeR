library(siland)


### Name: dataSiland
### Title: A simulated data set that reprsents observations.
### Aliases: dataSiland
### Keywords: datasets

### ** Examples

## No test: 
data(dataSiland)
data(landSiland)
nrow(dataSiland)
#Plot for landscape variables
plot(landSiland[[1]],col=2,pch=".")
points(landSiland[[2]],col=3,pch=".")
#Locations of observations
points(dataSiland[,c("X","Y")])
res=siland(y~locvar,land=landSiland,data=dataSiland,family=poisson)
summary(res)
#Model with random effect
res=siland(y~locvar+(1|Id),land=landSiland,data=dataSiland,family=poisson)
summary(res)
## End(No test)



