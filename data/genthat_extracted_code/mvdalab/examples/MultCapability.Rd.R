library(mvdalab)


### Name: MultCapability
### Title: Principal Component Based Multivariate Process Capability
###   Indices
### Aliases: MultCapability

### ** Examples

data(Wang_Chen_Sim)
lsls1 <- c(2.1, 304.5, 304.5)
usLs1 <- c(2.3, 305.1, 305.1)
targets1 <- c(2.2, 304.8, 304.8)

MultCapability(Wang_Chen_Sim, lsls = lsls1, usls = usLs1, targets = targets1, ncomps = 2)

data(Wang_Chen)
targets2 <- c(177, 53)
lsls2 <- c(112.7, 32.7)
usLs2 <- c(241.3, 73.3)

MultCapability(Wang_Chen, lsls = lsls2, usls = usLs2, targets = targets2, ncomps = 1)




