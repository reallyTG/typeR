library(elasticnet)


### Name: plot.enet
### Title: Plot method for enet objects
### Aliases: plot.enet
### Keywords: hplot methods

### ** Examples

data(diabetes)
attach(diabetes)
object <- enet(x,y,lambda=1)
par(mfrow=c(2,2))
plot(object)
plot(object,xvar="step")
detach(diabetes)



