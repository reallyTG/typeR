library(BAT)


### Name: optim.alpha.stats
### Title: Efficiency statistics for alpha-sampling.
### Aliases: optim.alpha.stats

### ** Examples

comm1 <- matrix(c(1,1,0,2,4,0,0,1,2,0,0,3), nrow = 4, ncol = 3, byrow = TRUE)
comm2 <- matrix(c(2,2,0,3,1,0,0,0,5,0,0,2), nrow = 4, ncol = 3, byrow = TRUE)
comm <- array(c(comm1, comm2), c(4,3,2))
colnames(comm) <- c("Sp1","Sp2","Sp3")
methods <- c("Met1","Met2","Met2","Met3")
tree <- hclust(dist(c(1:3), method="euclidean"), method="average")
optim.alpha.stats(comm,,methods, c(1,1,1))
optim.alpha.stats(comm, tree, methods = methods, samples = c(0,0,1), runs = 100)



