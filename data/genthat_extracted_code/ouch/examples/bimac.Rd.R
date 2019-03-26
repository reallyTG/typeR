library(ouch)


### Name: bimac
### Title: Anolis bimaculatus lizard size data.
### Aliases: bimac
### Keywords: models

### ** Examples

data(bimac)
tree <- with(bimac,ouchtree(node,ancestor,time/max(time),species))
plot(tree,node.names=TRUE)
print(h1 <- brown(log(bimac['size']),tree))
plot(h1)
print(h2 <- hansen(log(bimac['size']),tree,bimac['OU.1'],sqrt.alpha=1,sigma=1))
plot(h2)
print(h3 <- hansen(log(bimac['size']),tree,bimac['OU.3'],sqrt.alpha=1,sigma=1))
plot(h3)
print(h4 <- hansen(log(bimac['size']),tree,bimac['OU.4'],sqrt.alpha=1,sigma=1))
plot(h4)
h5 <- hansen(log(bimac['size']),tree,bimac['OU.LP'],sqrt.alpha=1,sigma=1,reltol=1e-5)
print(h5 <- update(h5,method='subplex',reltol=1e-11,parscale=c(0.1,0.1),hessian=TRUE))
simdat <- simulate(h5,nsim=10)
hsim <- update(h5,data=simdat[[1]])
print(summary(hsim))
bsim <- update(h1,data=simdat[[1]])
print(summary(bsim))



