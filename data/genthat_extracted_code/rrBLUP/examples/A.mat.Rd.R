library(rrBLUP)


### Name: A.mat
### Title: Additive relationship matrix
### Aliases: A.mat

### ** Examples

#random population of 200 lines with 1000 markers
X <- matrix(rep(0,200*1000),200,1000)
for (i in 1:200) {
  X[i,] <- ifelse(runif(1000)<0.5,-1,1)
}

A <- A.mat(X)



