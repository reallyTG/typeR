library(robCompositions)


### Name: impRZilr
### Title: EM-based replacement of rounded zeros in compositional data
### Aliases: impRZilr
### Keywords: manip multivariate

### ** Examples


data(arcticLake)
x <- arcticLake
## generate rounded zeros artificially:
#x[x[,1] < 5, 1] <- 0
x[x[,2] < 44, 2] <- 0
xia <- impRZilr(x, dl=c(5,44,0), eps=0.01, method="lm")
xia$x




