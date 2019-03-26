library(amap)


### Name: diss
### Title: Compute a dissimilarity matrix
### Aliases: diss
### Keywords: multivariate cluster

### ** Examples

data <-
matrix(c(1,1,1,1,1
        ,1,2,1,2,1
        ,2,3,2,3,2
        ,2,4,3,3,2
        ,1,2,4,2,1
        ,2,3,2,3,1),ncol=5,byrow=TRUE)

diss(data)

## With weights
diss(data,w=c(1,1,2,2,3))




