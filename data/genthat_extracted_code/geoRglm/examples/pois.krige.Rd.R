library(geoRglm)


### Name: pois.krige
### Title: Conditional Simulation and Prediction for the Poisson Spatial
###   model with a link function from the Box-Cox class
### Aliases: pois.krige .mcmc.aux .mcmc.boxcox.aux .mcmc.pois.log
###   .mcmc.pois.boxcox
### Keywords: spatial

### ** Examples

## Don't show: 
library(geoR)
## End(Don't show)
if(!exists(".Random.seed", envir=.GlobalEnv, inherits = FALSE)) set.seed(1234)
data(p50)
# First we scale the algorithm, and study how well the chain is mixing.
test <- pois.krige(p50, krige = list(cov.pars = c(1,1), beta = 1),
      mcmc.input = mcmc.control(S.scale = 0.2, thin = 1))
plot(log(test$intensity[45,]), type = "l")
acf(log(test$intensity[45,]), type = "correlation", plot = TRUE)
## Not run: 
##D # Now we make prediction (we decide to thin to every 10, which is the default),
##D # where we now use S.scale = 0.55.
##D test2 <- pois.krige(p50, locations = cbind(c(0.5,0.5), c(1,0.4)), 
##D       krige = krige.glm.control(cov.pars = c(1,1), beta = 1), 
##D       mcmc.input = mcmc.control(S.scale = 0.55)) 
## End(Not run)
## Don't show: 
y9 <- grf(grid = expand.grid(x = seq(1, 3, l = 3), y = seq(1, 3, l = 3)), cov.pars = c(0.1, 0.2))
y9$data <- rpois(9, lambda = exp(y9$data))
model2 <- krige.glm.control(cov.pars = c(1,1), beta = 1)
test2 <- pois.krige(y9, locations = cbind(c(0.5,0.5),c(1,0.4)),
krige = model2, mcmc.input = mcmc.control(S.scale = 0.5, thin = 1, n.iter=10), output = list(sim.predict = TRUE))
model2.u <- krige.glm.control(cov.pars = c(1,1), type.krige = "ok")
test2.unif.beta <- pois.krige(y9, krige = model2.u, mcmc.input =list(S.scale = 0.5, thin = 1, n.iter=10))
model2 <- krige.glm.control(cov.pars = c(1,1), beta = 1, aniso.pars=c(1,2))
test2 <- pois.krige(y9, locations = cbind(c(0.5,0.5),c(1,0.4)),
krige = model2, mcmc.input = list(S.scale = 0.5, thin = 1, n.iter=10)) 
## End(Don't show)



