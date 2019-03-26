library(rbvs)


### Name: rbvs
### Title: Ranking-Based Variable Selection
### Aliases: rbvs rbvs.default

### ** Examples

set.seed(1)

x <- matrix(rnorm(200*1000),200,1000)
active <- 1:4
beta <- c(3,2.5,-1.7,-1)
y <- 1*rnorm(200) +x[,active]%*%beta
#RBVS algorithm
rbvs.object <- rbvs(x,y, iterative=FALSE)
rbvs.object$active
rbvs.object$subsets[[1]][[4]]
#IRBVS algorithm
rbvs.object <- rbvs(x,y)
rbvs.object$active



