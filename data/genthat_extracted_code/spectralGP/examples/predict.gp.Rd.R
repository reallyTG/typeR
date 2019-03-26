library(spectralGP)


### Name: predict.gp
### Title: Prediction from a spectral GP object
### Aliases: predict.gp
### Keywords: models smooth spatial

### ** Examples

library(spectralGP)
gp1=gp(128,matern.specdens,c(1,4))
gp2=gp(c(64,64),matern.specdens,c(1,4))
simulate(gp1)
simulate(gp2)
gridvals=predict(gp1)
gridvals2=predict(gp2)

loc1=runif(100)
loc2=cbind(runif(100),runif(100,0,1))
map1=new.mapping(gp1,loc1)
map2=new.mapping(gp2,loc2)
vals1=predict(gp1,mapping=map1)
vals2=predict(gp2,mapping=map2)
#equivalently:
vals1=predict(gp1,loc1)
vals2=predict(gp2,loc2)
plot(gp1)
points(loc1,vals1)




