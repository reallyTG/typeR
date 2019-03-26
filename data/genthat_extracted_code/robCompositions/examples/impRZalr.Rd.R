library(robCompositions)


### Name: impRZalr
### Title: alr EM-based Imputation for Rounded Zeros
### Aliases: impRZalr
### Keywords: manip multivariate

### ** Examples


data(arcticLake)
x <- arcticLake
## generate rounded zeros artificially:
x[x[,1] < 5, 1] <- 0
x[x[,2] < 47, 2] <- 0
xia <- impRZalr(x, pos=3, dl=c(5,47), eps=0.05)
xia$xImp




