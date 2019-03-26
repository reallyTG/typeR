library(spectralGP)


### Name: gp
### Title: Create a new GP object
### Aliases: gp
### Keywords: models smooth spatial

### ** Examples

library(spectralGP)
gp1=gp(128,matern.specdens,c(1,4))
gp2=gp(c(64,64),matern.specdens,c(1,4))
simulate(gp1)
simulate(gp2)
plot(gp1)
plot(gp2)

n=100
locs=cbind(runif(n,0.2,1.2),runif(n,-0.2,1.4))
locs.predict=cbind(runif(n,-0.4,0.8),runif(n,-0.1,1.7))
scaled.locs=xy2unit(locs,rbind(locs,locs.predict))
scaled.locs.predict=xy2unit(locs.predict,rbind(locs,locs.predict))
train.map=new.mapping(gp2,scaled.locs)
predict.map=new.mapping(gp2,scaled.locs.predict)
vals.train=predict(gp2,mapping=train.map)
vals.predict=predict(gp2,mapping=predict.map)




