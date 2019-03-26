library(geoRglm)


### Name: binom.krige
### Title: Conditional Simulation and Prediction for the Binomial-logit
###   Spatial model
### Aliases: binom.krige .mcmc.binom.aux .mcmc.binom.logit
### Keywords: spatial

### ** Examples

## Don't show: 
library(geoR)
## End(Don't show)
if(!exists(".Random.seed", envir=.GlobalEnv, inherits = FALSE)) set.seed(1234)
data(b50)
# First we scale the algorithm, and study how well the chain is mixing.
test <- binom.krige(b50, krige = list(cov.pars = c(1,1), beta = 1),
      mcmc.input = mcmc.control(S.scale = 0.2, thin = 1))
plot(qlogis(test$prevalence[45,]), type = "l")
acf(qlogis(test$prevalence[45,]), type = "correlation", plot = TRUE)
## Not run: 
##D # Now we make prediction (we decide to thin to every 10, which is the default),
##D # where we now use S.scale = 0.7.
##D test2 <- binom.krige(b50, locations = cbind(c(0.5,0.5, 1, 1), c(0.4, 1, 0.4, 1)), 
##D       krige = krige.glm.control(cov.pars = c(1,1), beta = 1), 
##D       mcmc.input = mcmc.control(S.scale = 0.7))
##D image(test2)
##D contour(test2)  
## End(Not run)
## Don't show: 
y9 <- grf(grid = expand.grid(x = seq(1, 3, l = 3), y = seq(1, 3, l = 3)), cov.pars = c(0.1, 0.2))  
y9$data <- rbinom(9, prob = plogis(y9$data),size=1:9)
y9$units.m <- 1:9
model2 <- krige.glm.control(cov.pars = c(1,1), beta = 1)
test2 <- binom.krige(y9, locations = cbind(c(0.5,0.5),c(1,0.4)),
krige = model2, mcmc.input = mcmc.control(S.scale = 0.5, thin = 1, n.iter=10), output = list(sim.predict = TRUE))
model2.u <- krige.glm.control(cov.pars = c(1,1), type.krige = "ok")
test2.unif.beta <- binom.krige(y9, krige = model2.u, mcmc.input =list(S.scale = 0.5, thin = 1, n.iter=10))
model2 <- krige.glm.control(cov.pars = c(1,1), beta = 1, aniso.pars=c(1,2))
test2 <- binom.krige(y9, locations = cbind(c(0.5,0.5, 1, 1), c(0.4, 1, 0.4, 1)),
krige = model2, mcmc.input = list(S.scale = 0.5, thin = 1, n.iter=10))
image(test2)
contour(test2)
dev.off() 
## End(Don't show)



