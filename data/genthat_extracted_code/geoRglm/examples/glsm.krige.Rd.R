library(geoRglm)


### Name: glsm.krige
### Title: Prediction for a Generalised Linear Spatial Model
### Aliases: glsm.krige
### Keywords: spatial

### ** Examples

## Don't show: 
library(geoR)
## End(Don't show)
if(!exists(".Random.seed", envir=.GlobalEnv, inherits = FALSE)) set.seed(1234)
data(b50)
mcmc.5 <- mcmc.control(S.scale = 0.6, thin=1)
model.5 <- list(cov.pars=c(0.6, 0.1), beta=1, family="binomial")
outmcmc.5 <- glsm.mcmc(b50, model= model.5, mcmc.input = mcmc.5)
test2 <- glsm.krige(outmcmc.5, locations=matrix(c(0.15,0.15,0.005,0.05),2,2))
image(test2)
test3 <- glsm.krige(outmcmc.5, locations=matrix(c(0.15,0.15,0.005,0.05),2,2),
                     output=output.glm.control(sim.predict=TRUE, quantile=FALSE))



