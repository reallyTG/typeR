library(BAT)


### Name: alpha.estimate
### Title: Alpha diversity estimates.
### Aliases: alpha.estimate

### ** Examples

comm <- matrix(c(1,1,0,0,0,0,2,1,0,0,0,0,2,1,0,0,0,0,2,1), nrow = 4, ncol = 5, byrow = TRUE)
tree <- hclust(dist(c(1:5), method="euclidean"), method="average")
alpha.estimate(comm)
alpha.estimate(comm, tree)
alpha.estimate(comm, tree, func = "completeness")



