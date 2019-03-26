library(fusionclust)


### Name: nclust
### Title: No.of clusters
### Aliases: nclust

### ** Examples

library(fusionclust)
set.seed(42)
x<- c(rnorm(1000,-2,1), rnorm(1000,2,1))
out<- bmt(x)
k<- nclust(out)




