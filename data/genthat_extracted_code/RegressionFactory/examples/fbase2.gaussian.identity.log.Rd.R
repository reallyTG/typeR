library(RegressionFactory)


### Name: fbase2.gaussian.identity.log
### Title: Double-Parameter Base Log-likelihood Function for Gaussian GLM
### Aliases: fbase2.gaussian.identity.log

### ** Examples

## Not run: 
##D library(sns)
##D library(MfUSampler)
##D library(dglm)
##D 
##D # defining log-likelihood function
##D # vd==FALSE leads to constant-dispersion model (ordinary linear regression)
##D # while vd==TRUE produces varying-dispersion model
##D loglike.linreg <- function(coeff, X, y, fgh, block.diag = F, vd = F) {
##D   if (vd) regfac.expand.2par(coeff = coeff, X = X, Z = X, y = y
##D     , fbase2 = fbase2.gaussian.identity.log, fgh = fgh, block.diag = block.diag)
##D   else regfac.expand.2par(coeff = coeff, X = X, y = y
##D     , fbase2 = fbase2.gaussian.identity.log, fgh = fgh, block.diag = block.diag)
##D }
##D 
##D # simulating data according to generative model
##D N <- 1000 # number of observations
##D K <- 5 # number of covariates
##D X <- matrix(runif(N*K, min=-0.5, max=+0.5), ncol=K)
##D beta <- runif(K, min=-0.5, max=+0.5)
##D gamma <- runif(K, min=-0.5, max=+0.5)
##D mean.vec <- X%*%beta
##D sd.vec <- exp(X%*%gamma)
##D y <- rnorm(N, mean.vec, sd.vec)
##D 
##D # constant-dispersion model
##D # estimation using glm
##D est.glm <- lm(y~X-1)
##D beta.glm <- est.glm$coefficients
##D sigma.glm <- summary(est.glm)$sigma
##D # estimation using RegressionFactory
##D # (we set rnd=F in sns to allow for better comparison with glm)
##D nsmp <- 20
##D coeff.smp <- array(NA, dim=c(nsmp, K+1)) 
##D coeff.tmp <- rep(0, K+1)
##D for (n in 1:nsmp) {
##D   coeff.tmp <- sns(coeff.tmp, fghEval=loglike.linreg
##D     , X=X, y=y, fgh=2, block.diag = F, vd = F, rnd = F)
##D   coeff.smp[n,] <- coeff.tmp
##D }
##D beta.regfac.cd <- colMeans(coeff.smp[(nsmp/2+1):nsmp, 1:K])
##D sigma.regfac.cd <- sqrt(exp(mean(coeff.smp[(nsmp/2+1):nsmp, K+1])))
##D # comparing glm and RegressionFactory results
##D # beta's must match exactly between glm and RegressionFactory
##D cbind(beta, beta.glm, beta.regfac.cd)
##D # sigma's won't match exactly
##D cbind(mean(sd.vec), sigma.glm, sigma.regfac.cd)
##D 
##D # varying-dispersion model
##D # estimation using dglm
##D est.dglm <- dglm(y~X-1, dformula = ~X-1, family = "gaussian", dlink = "log")
##D beta.dglm <- est.dglm$coefficients
##D gamma.dglm <- est.dglm$dispersion.fit$coefficients
##D # estimation using RegressionFactory
##D coeff.smp <- array(NA, dim=c(nsmp, 2*K)) 
##D coeff.tmp <- rep(0, 2*K)
##D for (n in 1:nsmp) {
##D   coeff.tmp <- sns(coeff.tmp, fghEval=loglike.linreg
##D     , X=X, y=y, fgh=2, block.diag = F, vd = T, rnd = F)
##D   coeff.smp[n,] <- coeff.tmp
##D }
##D beta.regfac.vd <- colMeans(coeff.smp[(nsmp/2+1):nsmp, 1:K])
##D gamma.regfac.vd <- colMeans(coeff.smp[(nsmp/2+1):nsmp, K+1:K])
##D # comparing dglm and RegressionFactory results
##D # neither beta's nor gamma's will match exactly
##D cbind(beta, beta.dglm, beta.regfac.vd)
##D cbind(gamma, gamma.dglm, gamma.regfac.vd)
##D 
## End(Not run)



