library(SensoMineR)


### Name: simulation
### Title: Simulate virtual panels
### Aliases: simulation
### Keywords: models internal

### ** Examples

data(chocolates)
donnee <- cbind.data.frame(sensochoc[,c(1,4,5:18)])
axe <- construct.axes(donnee, scale.unit = TRUE)
simul <- simulation(axe)
plotellipse (simul, alpha = 0.05, eig = signif(axe$eig,4))



