library(geoRglm)


### Name: likfit.glsm
### Title: Monte Carlo Maximum Likelihood Estimation in a Generalised
###   Linear Spatial Model
### Aliases: likfit.glsm .func.val .NewtonRhapson.step .maxim.aux1 .lik.sim
###   .lik.sim.boxcox
### Keywords: spatial

### ** Examples

data(p50)
## Don't show: 
library(geoR)
## End(Don't show)
## Not run: 
##D mcmc.5 <- mcmc.control(S.scale = 0.6, thin=20, n.iter=50000, burn.in=1000)
##D model.5 <- list(cov.pars=c(0.6, 0.1), beta=1, family="poisson")
##D outmcmc.5 <- glsm.mcmc(p50, model= model.5, mcmc.input = mcmc.5)     
##D mcmcobj.5 <- prepare.likfit.glsm(outmcmc.5)   
##D lik.5 <- likfit.glsm(mcmcobj.5, ini.phi = 0.1, fix.nugget.rel = TRUE)
##D print(lik.5)
##D summary(lik.5)
##D lik.5.sph.nugget <- likfit.glsm(mcmcobj.5, ini.phi = 1, 
##D                            cov.model = "spherical", nugget.rel = 0.385)
##D print(lik.5.sph.nugget)
##D summary(lik.5.sph.nugget)
## End(Not run)
## Don't show: 
y9 <- list(data=p50$data[1:9],coords=p50$coords[1:9,])
class(y9) <- "geodata"
mcmc.5 <- mcmc.control(S.scale = 0.6, n.iter = 100)
model.5 <- list(cov.pars=c(0.1, 1), beta=1.1, family="poisson")
outmcmc.5 <- glsm.mcmc(y9, model= model.5, mcmc.input = mcmc.5)     
mcmcobj.5 <- prepare.likfit.glsm(outmcmc.5)   
lik.5 <- likfit.glsm(mcmcobj.5, ini.phi = 0.4, fix.nugget.rel = TRUE)
print(lik.5)
summary(lik.5)
data(b50)
b9 <- list(data=b50$data[1:9],coords=b50$coords[1:9,])
trend5 <- 1:9-5
model5 <- list(cov.pars=c(0.1, 1), beta=c(1.2,0),family="binomial",trend=~trend5)
outmcmc5 <- glsm.mcmc(b9, model= model5, mcmc.input = mcmc.5)  
mcmcobj5 <- prepare.likfit.glsm(outmcmc5)   
lik5 <- likfit.glsm(mcmcobj5, trend=model5$trend, ini.phi = 1,
                    fix.nugget.rel = TRUE)
print(lik5)
summary(lik5)
## End(Don't show)



