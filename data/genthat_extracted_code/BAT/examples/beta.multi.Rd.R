library(BAT)


### Name: beta.multi
### Title: Beta diversity among multiple communities.
### Aliases: beta.multi

### ** Examples

comm <- matrix(c(2,2,0,0,0,1,1,0,0,0,0,2,2,0,0,0,0,0,2,2), nrow = 4, ncol = 5, byrow = TRUE)
tree <- hclust(dist(c(1:5), method="euclidean"), method="average")
beta.multi(comm)
beta.multi(comm, func = "Soerensen")
beta.multi(comm, tree)
beta.multi(comm, raref = 1)
beta.multi(comm, tree, TRUE, "s", raref = 2)



