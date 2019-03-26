library(PHYLOGR)


### Name: plot.phylog.cancor
### Title: Plot a phylog.cancor object
### Aliases: plot.phylog.cancor
### Keywords: methods

### ** Examples

data(SimulExample)
ex1.cancor <- cancor.phylog(SimulExample[,c(1,2,3,4,5)],SimulExample[,c(1,2,6,7,8)])
ex1.cancor
summary(ex1.cancor)
par(mfrow=c(1,3))
plot(ex1.cancor)



