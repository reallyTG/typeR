library(mev)


### Name: rmevspec
### Title: Random samples from spectral distributions of multivariate
###   extreme value models.
### Aliases: rmevspec

### ** Examples

set.seed(1)
rmevspec(n=100, d=3, param=2.5, model="log")
rmevspec(n=100, d=3, param=2.5, model="neglog")
rmevspec(n=100, d=4, param=c(0.2,0.1,0.9,0.5), model="bilog")
rmevspec(n=100, d=2, param=c(0.8,1.2), model="ct") #Dirichlet model
rmevspec(n=100, d=2, param=c(0.8,1.2,0.5), model="sdir") #with additional scale parameter
#Variogram gamma(h) = scale*||h||^alpha
#NEW: Variogram must take distance as argument
vario <- function(x, scale=0.5, alpha=0.8){ scale*x^alpha }
#grid specification
grid.loc <- as.matrix(expand.grid(runif(4), runif(4)))
rmevspec(n=100, vario=vario,loc=grid.loc, model="br")
## Example with Dirichlet mixture
alpha.mat <- cbind(c(2,1,1),c(1,2,1),c(1,1,2))
rmevspec(n=100, param=alpha.mat, weights=rep(1/3,3), model="dirmix")



