library(lvm4net)


### Name: plot.gofobj
### Title: Plot GoF object
### Aliases: plot.gofobj

### ** Examples

Y <- network(20, directed = FALSE)[,]

modLSM <- lsm(Y, D = 2) 
myGof <- goflsm(modLSM, Y = Y, doplot = FALSE)
plot(myGof)



