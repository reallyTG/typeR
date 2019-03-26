library(geoRglm)


### Name: proflik.glsm
### Title: Computes Profile Likelihood for generalised linear spatial
###   models
### Aliases: proflik.glsm
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
##D lik.5.sph.nugget <- likfit.glsm(mcmcobj.5, ini.phi = 1, 
##D              cov.model = "spherical", nugget.rel = 0.385)
##D pr.lik.5.sph.nugget <- proflik.glsm(mcmcobj.5, lik.5.sph.nugget,
##D          phi.values = seq(0.5,5,l=10), nugget.rel.values=seq(0.5,5,l=10))
##D plot(pr.lik.5.sph.nugget)
## End(Not run)
## Don't show: 
y9 <- list(data=p50$data[1:9],coords=p50$coords[1:9,])
class(y9) <- "geodata"
mcmc.5 <- mcmc.control(S.scale = 0.6, n.iter = 100)
model.5 <- list(cov.pars=c(0.1, 1), beta=1.1, family="poisson")
outmcmc.5 <- glsm.mcmc(y9, model= model.5, mcmc.input = mcmc.5)     
mcmcobj.5 <- prepare.likfit.glsm(outmcmc.5)   
lik.5.sph.nugget <- likfit.glsm(mcmcobj.5, ini.phi = 1, 
                           cov.model = "spherical", nugget.rel = 0.385)
pr.lik.5.sph.nugget <- proflik.glsm(mcmcobj.5, lik.5.sph.nugget,
         phi.values = seq(0.5,5,l=3), nugget.rel.values=seq(0.5,5,l=3))
plot(pr.lik.5.sph.nugget)
## End(Don't show)



