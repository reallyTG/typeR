library(BAT)


### Name: alpha.accum
### Title: Alpha diversity accumulation curves (observed and estimated).
### Aliases: alpha.accum

### ** Examples

comm <- matrix(c(1,1,0,0,0,0,2,1,0,0,0,0,2,1,0,0,0,0,2,1), nrow = 4, ncol = 5, byrow = TRUE)
tree <- hclust(dist(c(1:5), method="euclidean"), method="average")
alpha.accum(comm)
alpha.accum(comm, func = "nonparametric")
alpha.accum(comm, tree, "completeness")
alpha.accum(comm, tree, "curve", runs = 1000)
alpha.accum(comm, target = -1)



