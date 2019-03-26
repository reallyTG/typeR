library(lvm4net)


### Name: print.gofobj
### Title: Print GoF object
### Aliases: print.gofobj

### ** Examples

Y <- network(20, directed = FALSE)[,]

modLSM <- lsm(Y, D = 2) 
myGof <- goflsm(modLSM, Y = Y, doplot = FALSE)
print(myGof)



