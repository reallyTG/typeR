library(BAT)


### Name: beta.accum
### Title: Beta diversity accumulation curves.
### Aliases: beta.accum

### ** Examples

comm1 <- matrix(c(2,2,0,0,0,1,1,0,0,0,0,2,2,0,0,0,0,0,2,2), nrow = 4, byrow = TRUE)
comm2 <- matrix(c(1,1,0,0,0,0,2,1,0,0,0,0,2,1,0,0,0,0,2,1), nrow = 4, byrow = TRUE)
tree <- hclust(dist(c(1:5), method="euclidean"), method="average")
beta.accum(comm1, comm2)
beta.accum(comm1, comm2, func = "Soerensen")
beta.accum(comm1, comm2, tree)
beta.accum(comm1, comm2, abund = TRUE)
beta.accum(comm1, comm2, tree, TRUE)



