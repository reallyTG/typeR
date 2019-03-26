library(Boom)


### Name: thin.matrix
### Title: Thin a Matrix
### Aliases: ThinMatrix

### ** Examples

m <- matrix(1:100, ncol = 2)
ThinMatrix(m, thin = 10)
##      [,1] [,2]
## [1,]   10   60
## [2,]   20   70
## [3,]   30   80
## [4,]   40   90
## [5,]   50  100



