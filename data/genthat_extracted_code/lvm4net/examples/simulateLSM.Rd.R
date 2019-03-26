library(lvm4net)


### Name: simulateLSM
### Title: Simulate from LSM model
### Aliases: simulateLSM

### ** Examples


n <- 20
Y <- network(n, directed = FALSE)[,]

modLSM <- lsm(Y, D = 2) 

Ysim <- simulateLSM(modLSM, Y = Y, nsim = 8)
# store EZ, to keep the nodes in the same positions 
# and compare the networks
EZ <- modLSM$lsmEZ
par(mfrow = c(3,3))
plotY(Y, EZ = EZ, main = "Original Data")
for(i in 1:8) plotY(Ysim[[i]], EZ = EZ, main = paste("Simulation" , i))
par(mfrow = c(1,1))



