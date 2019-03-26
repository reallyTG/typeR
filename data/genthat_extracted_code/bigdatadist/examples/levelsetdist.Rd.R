library(bigdatadist)


### Name: levelsetdist
### Title: Level Set Distances
### Aliases: levelsetdist
### Keywords: Probability metrics

### ** Examples

require(MASS);
set.seed(1)
A = mvrnorm(100,c(0,0),diag(2));  B = mvrnorm(150,c(1,1),diag(2)); 
levelsetdist(A, B)



