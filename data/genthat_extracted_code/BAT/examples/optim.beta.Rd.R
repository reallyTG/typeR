library(BAT)


### Name: optim.beta
### Title: Optimization of beta diversity sampling protocols.
### Aliases: optim.beta

### ** Examples

comm1 <- matrix(c(1,1,0,2,4,0,0,1,2,0,0,3), nrow = 4, ncol = 3, byrow = TRUE)
comm2 <- matrix(c(2,2,0,3,1,0,0,0,5,0,0,2), nrow = 4, ncol = 3, byrow = TRUE)
comm3 <- matrix(c(2,0,0,3,1,0,0,0,5,0,0,2), nrow = 4, ncol = 3, byrow = TRUE)
comm <- array(c(comm1, comm2, comm3), c(4,3,3))
colnames(comm) <- c("sp1","sp2","sp3")
methods <- c("Met1","Met2","Met2","Met3")
tree <- hclust(dist(c(1:3), method="euclidean"), method="average")
optim.beta(comm, methods = methods, runs = 100)
optim.beta(comm, tree, methods = methods, abund = TRUE, base = c(0,0,1), runs = 100)



