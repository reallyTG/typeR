library(flexclust)


### Name: Nclus
### Title: Artificial Example with 4 Gaussians
### Aliases: Nclus
### Keywords: datasets

### ** Examples

data(Nclus)
cl <- cclust(Nclus, k=4, simple=FALSE, save.data=TRUE)
plot(cl)



