library(BAT)


### Name: optim.beta.stats
### Title: Efficiency statistics for beta-sampling.
### Aliases: optim.beta.stats

### ** Examples

comm1 <- matrix(c(1,1,0,2,4,0,0,1,2,0,0,3), nrow = 4, ncol = 3, byrow = TRUE)
comm2 <- matrix(c(2,2,0,3,1,0,0,0,5,0,0,2), nrow = 4, ncol = 3, byrow = TRUE)
comm3 <- matrix(c(2,0,0,3,1,0,0,0,5,0,0,2), nrow = 4, ncol = 3, byrow = TRUE)
comm <- array(c(comm1, comm2, comm3), c(4,3,3))
colnames(comm) <- c("sp1","sp2","sp3")
methods <- c("Met1","Met2","Met2","Met3")
tree <- hclust(dist(c(1:3), method="euclidean"), method="average")
optim.beta.stats(comm,,methods, c(1,1,1))
optim.beta.stats(comm, tree, methods = methods, samples = c(0,0,1), runs = 100)



