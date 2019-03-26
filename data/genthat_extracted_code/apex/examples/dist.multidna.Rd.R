library(apex)


### Name: dist.multidna
### Title: Pairwise distances for multiple gene data
### Aliases: dist.multidna

### ** Examples


## simple conversion with nicely ordered output
data(woodmouse)
genes <- list(gene1=woodmouse[,1:500], gene2=woodmouse[,501:965])
x <- new("multidna", genes)
x
plot(x)

## get separate distance matrix and pooled one
lD <- dist.multidna(x)
D <- dist.multidna(x, pool=TRUE)

## get corresponding NJ trees
ltrees <- lapply(lD, nj)
tree <- nj(D)

par(mfrow=c(3,1))
for(i in 1:2) plot(ltrees[[i]], main=names(ltrees)[i])
plot(tree, main="Pooled distances")




