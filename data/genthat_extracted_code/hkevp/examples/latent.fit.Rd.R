library(hkevp)


### Name: latent.fit
### Title: Fitting procedure of the latent variable model
### Aliases: latent.fit

### ** Examples

# Simulation of HKEVP:
sites <- as.matrix(expand.grid(1:4,1:4))
loc <- sites[,1]*10
scale <- 3
shape <- .2
alpha <- 1
tau <- 2
ysim <- hkevp.rand(15, sites, sites, loc, scale, shape, alpha, tau)

# Latent Variable Model fit:
set.seed(1)
fit <- latent.fit(ysim, sites, niter = 10000, nburn = 5000, nthin = 5)



mcmc.plot(fit, TRUE)
par(mfrow = c(2,2))
apply(fit$GEV[,1,], 1, acf)








