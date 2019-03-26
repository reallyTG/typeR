library(lvm4net)


### Name: goflsm
### Title: Goodness-of-Fit diagnostics for LSM model
### Aliases: goflsm

### ** Examples


Y <- network(15, directed = FALSE)[,]

modLSM <- lsm(Y, D = 2) 
myGof <- goflsm(modLSM, Y = Y)



