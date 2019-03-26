library(geoRglm)


### Name: binom.krige.bayes
### Title: Bayesian Posterior Simulation and Prediction for the Binomial
###   Spatial model
### Aliases: binom.krige.bayes .mcmc.bayes.binom.logit
###   .mcmc.bayes.conj.binom.logit
### Keywords: spatial

### ** Examples

data(b50)
## Don't show: 
library(geoR)
## End(Don't show)
if(!exists(".Random.seed", envir=.GlobalEnv, inherits = FALSE)) set.seed(1234)
## Not run: 
##D mcmc.10 <- mcmc.control(S.scale = 0.09, n.iter = 1000, phi.scale = 0.2, 
##D               phi.start = 4.5)
##D prior.10 <- prior.glm.control(phi.discrete = seq(0.2,5,0.2))
##D test.10 <- binom.krige.bayes(b50, locations=t(cbind(c(2.5,3.5),c(-1,3.5),c(2.5,1.5),c(-1,1.5))),
##D               prior = prior.10, mcmc.input = mcmc.10)
##D image(test.10)
##D persp(test.10)
## End(Not run)
## Don't show: 
##b9 <- grf(grid = expand.grid(x = seq(1, 7, l = 3), y = seq(1, 7, l = 3)), cov.pars = c(0.1, 2))
##b9$units.m <- rep(4,9)
##b9$data <- rbinom(9, size = rep(4,9), prob = exp(b9$data)/(1+exp(b9$data)))
##
##b9.pr <- prior.glm.control(phi.discrete = c(2.5, 3))
##b9.mcmc <- mcmc.control(S.scale = 0.1, phi.scale = 1.4,n.iter=10,thin=1) 
##grid <- expand.grid(x = c(1, 7), y = c(1, 6))
##run.b9 <- binom.krige.bayes(b9, locations = grid, prior = b9.pr, mcmc.input = b9.mcmc) 
##image(run.b9, locations = grid, values.to.plot="median")
##pred.grid <- expand.grid(x = seq(0.0125, 0.9875, l = 2), y = seq(0.0125, 0.9875, l = 2))
##prior.b9 <- prior.glm.control(beta.prior = "normal", beta = 0, beta.var.std = 1, phi.prior = "exponential", 
##phi = 2.5, phi.discrete = c(2.5,3), sigmasq.prior = "sc.inv.chisq", df.sigmasq = 5, sigmasq = 0.5) 
##mcmc.b9 <- mcmc.control(S.scale = 0.05, phi.scale = 1.5, thin = 1, burn.in = 1, n.iter=10)
##run.b9 <- binom.krige.bayes(b9, prior = prior.b9, mcmc.input = mcmc.b9, locations = pred.grid, 
##output = list(sim.predict = TRUE))
##run.mean <- apply(run.b9$pre$sim,1,mean)
##rum.med.ctrl <- apply(run.b9$pre$sim,1,median)
##A <- apply(run.b9$pre$sim,2,mean)
####
##prior2.b9 <- prior.glm.control(beta.prior = "normal", beta = c(0,0,0), 
##beta.var.std = matrix(cbind(c(1,0.25,0),c(0.25,0.5,0.125),c(0,0.125,0.5)),3,3), 
##phi.prior = "exponential", phi = 2.5, phi.discrete = c(2.5,3), sigmasq.prior = "sc.inv.chisq", 
##df.sigmasq = 5, sigmasq = 0.5) 
##mcmc2.b9 <- mcmc.control(S.scale = 0.02, phi.scale = 1.5, thin = 1, n.iter=10)
##run2.b9 <- binom.krige.bayes(b9, prior = prior2.b9, mcmc.input = mcmc2.b9, model = list(trend.d ="1st", trend.l ="1st"), 
##locations = pred.grid, output = output.glm.control(sim.predict = TRUE))
##
##prior3.b9 <- prior.glm.control(beta.prior = "normal", beta = 0,
##beta.var.std = 100, phi.prior = "exponential", phi = 2.5, phi.discrete=c(2.5,3),
##sigmasq.prior = "sc.inv.chisq", df.sigmasq = 5, sigmasq = 0.5,tausq.rel=0.1) 
##mcmc3.b9 <- mcmc.control(S.scale = 0.0007, phi.scale = 1.5, thin = 1,
##n.iter=10)
##run3.b9 <- binom.krige.bayes(b9, prior = prior3.b9, mcmc.input =
##mcmc3.b9, locations = pred.grid, output = output.glm.control(sim.predict
##= TRUE), model = model.glm.control(aniso.pars = c(1,2), kappa =1))
##
##prior4.b9 <- prior.glm.control(beta.prior = "flat", phi.prior = "exponential", phi = 2.5, phi.discrete = c(2.5,3), 
##sigmasq.prior = "sc.inv.chisq", df.sigmasq = 5, sigmasq = 0.5) 
##mcmc4.b9 <- mcmc.control(S.scale = 0.2, phi.scale = 1.5, thin = 1, n.iter=10)
##run4.b9 <- binom.krige.bayes(b9, prior = prior4.b9, mcmc.input = mcmc4.b9, locations = pred.grid, 
##output = list(sim.predict = TRUE))
##mean(run3.b9$pos$phi$s)
##mean(run4.b9$pos$phi$s)
##AA <- apply(run.b9$pre$sim,2,mean)
####
##prior.b9 <- prior.glm.control(beta.prior = "normal", beta = 0, beta.var.std = 1, phi.prior = "fixed", phi = 2.5, 
##sigmasq.prior = "sc.inv.chisq", df.sigmasq = 50, sigmasq = 0.5) 
##mcmc.b9 <- mcmc.control(S.scale = 0.05, phi.scale = 1.5, thin = 1, n.iter=10)
##run3.b9 <- binom.krige.bayes(b9, prior = prior.b9, mcmc.input = mcmc.b9, locations = pred.grid)
##prior4.b9 <- prior.glm.control(beta.prior = "flat", phi.prior = "fixed", phi = 2, 
##sigmasq.prior = "sc.inv.chisq", df.sigmasq = 50, sigmasq = 0.5) 
##mcmc4.b9 <- mcmc.control(S.scale = 0.2, phi.scale = 0.015, thin = 1, n.iter =10)
##run4.b9 <- binom.krige.bayes(b9, prior = prior4.b9, mcmc.input = mcmc4.b9, locations = pred.grid,
##output = list(sim.predict = TRUE))
##
##prior3.b9 <- prior.glm.control(beta.prior = "normal", beta = 0, beta.var.std = 100, phi.prior = "fixed", phi = 2, 
##sigmasq.prior = "fixed", sigmasq = 0.5)
##mcmc3.b9 <- list(S.scale = 0.0007, thin = 1, n.iter =10)
##run3.b9 <- binom.krige.bayes(b9, prior = prior3.b9, mcmc.input = mcmc3.b9, locations = pred.grid)
##prior4.b9 <- prior.glm.control(beta.prior = "flat", phi.prior = "fixed", phi = 2, sigmasq.prior = "fixed", sigmasq = 0.5)
##mcmc4.b9 <- mcmc.control(S.scale = 0.2, thin = 1, n.iter =10)
##run4.b9 <- binom.krige.bayes(b9, prior = prior4.b9, mcmc.input =
##mcmc4.b9, locations = pred.grid, output = output.glm.control(sim.predict
##= TRUE))
## End(Don't show)



