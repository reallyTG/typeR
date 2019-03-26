library(spectralGP)


### Name: new.mapping
### Title: Map arbitrary locations to gridpoints of spectral GP object
### Aliases: new.mapping
### Keywords: models smooth spatial

### ** Examples

library(spectralGP)
loc1=runif(100)
loc2=cbind(runif(100),runif(100,0,1))
gp1=gp(128,matern.specdens,c(1,4))
gp2=gp(c(64,64),matern.specdens,c(1,4))
map1=new.mapping(gp1,loc1)
map2=new.mapping(gp2,loc2)
simulate(gp1)
simulate(gp2)
vals1=predict(gp1,mapping=map1)
vals2=predict(gp2,mapping=map2)
plot(gp1)
points(loc1,vals1)



