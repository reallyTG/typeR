library(geoRglm)


### Name: pois.krige.bayes
### Title: Bayesian Posterior Simulation and Prediction for the Poisson
###   Spatial model
### Aliases: pois.krige.bayes .mcmc.bayes.pois.log .mcmc.bayes.pois.boxcox
###   .mcmc.bayes.conj.pois.log .mcmc.bayes.conj.pois.boxcox
### Keywords: spatial

### ** Examples

data(p50)
## Don't show: 
library(geoR)
## End(Don't show)
if(!exists(".Random.seed", envir=.GlobalEnv, inherits = FALSE))
set.seed(1234)
## Not run: 
##D ## MCMC with fixed phi
##D prior.5 <- prior.glm.control(phi.prior = "fixed", phi = 0.1)
##D mcmc.5 <- mcmc.control(S.scale = 0.01, thin = 1)
##D test.5 <- pois.krige.bayes(p50, prior = prior.5, mcmc.input = mcmc.5)
##D par(mfrow=c(1,2))
##D hist(test.5)
##D ## Now chose S.scale (Acc-rate=0.60 is preferable).
##D mcmc.5.new <- mcmc.control(S.scale = 0.08, thin = 100)
##D test.5.new <- pois.krige.bayes(p50,
##D                locations = t(cbind(c(2.5,3.5),c(-6,3.5),c(2.5,-3.5),c(-6,-3.5))), 
##D                prior = prior.5, mcmc.input = mcmc.5.new, 
##D                output = list(threshold = 10, quantile = c(0.49999,0.99)))
##D image(test.5.new)
##D persp(test.5.new)
##D ## MCMC with random phi.
##D ## Note here that we can start with the S.scale from above.
##D mcmc.6 <- mcmc.control(S.scale = 0.08, n.iter = 2000, thin = 100, 
##D                        phi.scale = 0.01)
##D prior.6 <- prior.glm.control(phi.discrete = seq(0.02, 1, 0.02))
##D test.6 <- pois.krige.bayes(p50, prior = prior.6, mcmc.input = mcmc.6)
##D ## Acc-rate=0.60 , acc-rate-phi = 0.25-0.30  are preferable
##D mcmc.6.new <- mcmc.control(S.scale=0.08, n.iter = 400000, thin = 200,
##D                        burn.in = 5000, phi.scale = 0.12, phi.start = 0.5)
##D prior.6 <- prior.glm.control(phi.prior = "uniform", 
##D                phi.discrete = seq(0.02, 1, 0.02))
##D test.6.new <- pois.krige.bayes(p50, 
##D                  locations = t(cbind(c(2.5,3.5), c(-60,-37))), 
##D                  prior = prior.6, mcmc.input = mcmc.6.new)
##D par(mfrow=c(3,1))
##D hist(test.6.new)
## End(Not run)
## Don't show: 
##y9 <- list(data=p50$data[c(1:4,10:14)],coords=p50$coords[c(1:4,10:14),],units.m=p50$units.m[c(1:4,10:14)])
##class(y9) <- "geodata"
##mcmc5 <- mcmc.control(S.scale = 0.1, thin = 1, n.iter=10)
##test5 <- pois.krige.bayes(y9, locations = t(cbind(c(2,1),c(-6050,-3270),c(1.1,2.1),c(2,3))),
##prior = list(phi.prior = "fixed", phi= 1), mcmc.input = mcmc5,
##output = list(threshold = c(9,10), quantile = c(0.05,0.99),
##sim.predict=TRUE))
##par(mfrow=c(1,2))
##hist(test5)
##prior6 <- prior.glm.control(phi.prior = "uniform", phi.discrete =
##c(0.98,1.02), tausq.rel = 0.05)
##mcmc6 <- list(S.scale = 0.1, thin = 1, n.iter=10, burn.in = 1, phi.scale = 0.01, phi.start = 1) 
##test6 <- pois.krige.bayes(y9, locations=t(cbind(c(2.5,3.5),c(-60,-37))),
##prior = prior6, mcmc.input = mcmc6)
##par(mfrow=c(3,1))
##hist(test6,density.est=FALSE)
##run2.y9 <- pois.krige.bayes(y9, prior = list(phi.prior = "fixed", phi= 1), mcmc.input = mcmc5,
##model = list(trend.d ="1st", trend.l ="1st", aniso.pars =c(1,2), kappa
##=1, lambda= 0.5), locations = t(cbind(c(2.5,3.5),c(-60,-37))) ,
##output = output.glm.control(sim.predict = TRUE))  
## End(Don't show)



