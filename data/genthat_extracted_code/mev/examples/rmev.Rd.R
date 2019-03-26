library(mev)


### Name: rmev
### Title: Exact simulations of multivariate extreme value distributions
### Aliases: rmev

### ** Examples

set.seed(1)
rmev(n=100, d=3, param=2.5, model="log", alg="ef")
rmev(n=100, d=4, param=c(0.2,0.1,0.9,0.5), model="bilog", alg="sm")
## Spatial example using power variogram
#NEW: Variogram must take distance as argument
vario <- function(x, scale, alpha){ scale*x^alpha }
#grid specification
grid.loc <- as.matrix(expand.grid(runif(4), runif(4)))
rmev(n=100, vario=vario,loc=grid.loc, model="br", scale = 0.5, alpha = 1)
vario2cov <- function(loc, ...){
 sapply(1:nrow(loc), function(i) sapply(1:nrow(loc), function(j)
  vario(sqrt(sum((loc[i,])^2)), ...) +
  vario(sqrt(sum((loc[j,])^2)), ...) -
  vario(sqrt(sum((loc[i,]-loc[j,])^2)), ...)))
}
rmev(n=100, sigma=vario2cov(grid.loc, scale = 0.5, alpha = 1), model="br")
#Example with a grid (generating an array)
rmev(n=10, sigma=cbind(c(2,1),c(1,3)), loc=cbind(runif(4),runif(4)),model="smith", grid=TRUE)
## Example with Dirichlet mixture
alpha.mat <- cbind(c(2,1,1),c(1,2,1),c(1,1,2))
rmev(n=100, param=alpha.mat, weights=rep(1/3,3), model="dirmix")



