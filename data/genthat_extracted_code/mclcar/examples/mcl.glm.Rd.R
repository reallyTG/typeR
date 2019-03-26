library(mclcar)


### Name: mcl.glm
### Title: Monte Carlo likelihood calculation for glm with latent CAR
###   variables.
### Aliases: mcl.prep.glm mcl.glm mcl.profile.glm vmle.glm get.beta.glm
### Keywords: CAR glm Monte Carlo likelihood

### ** Examples

## Simulate some data to work with
set.seed(33)
n.torus <- 10
nb <- 30
rho <- 0.2
sigma <- 1.5
beta <- c(1, 1)
pars.true <- c(rho, sigma, beta)
X0 <- cbind(rep(1, n.torus^2), sample(log(1:n.torus^2)/5))

mydata2 <- CAR.simGLM(method = "binom", n = c(n.torus, n.torus), pars = pars.true,
                      Xs = as.matrix(X0), n.trial = nb)

## Prepare the Monte Carlo samples
## Find a suitable initial value for the importance sampler parameter, e.g:
library(spdep)
data.glm <- data.frame(y=mydata2$y, mydata2$covX[,-1])
fit.glm <- glm(cbind(y, nb-mydata2$y) ~ .,data = data.glm, family=binomial)
logitp <- log((mydata2$y+0.5)/(mydata2$n.trial - mydata2$y + 0.5))
data.splm <- data.frame(y=logitp, mydata2$covX[,-1])
listW <- mat2listw(mydata2$W)
fit.splm <- spautolm(y~., data = data.splm, listw=listW, family = "CAR")
psi.binom <- c(fit.splm$lambda, fit.splm$fit$s2, coef(fit.glm))

## Set the parameters for the MCMC algorithm
mc.pars <- list(N.YZ =1e3, N.Zy = 1e3, Scale = 1.65/(n.torus^(2/6)), thin = 5,
                   burns = 5e2, method = "mala", scale.fixed = TRUE)

mc.data2 <- mcl.prep.glm(data = mydata2, family = "binom",
                         psi = psi.binom, mcmc.control = mc.pars,
                         pilot.plot = TRUE, plot.diag = TRUE)

## Calculate the Monte Carlo likelihoods
pars.t <- c(rho, sigma, beta)

mcl.glm(pars.t, family = "binom",  mcdata = mc.data2, Evar = TRUE)

## Do a direct optimization of the Monte Carlo likelihood function to find the MLE
## Not run: 
##D library(maxLik)
##D A <- matrix(0, nrow = 3, ncol = length(pars.t))
##D A[,1] <- c(1, -1, 0)
##D A[,2] <- c(0, 0, 1)
##D B <- c(0.24, 0.24, -0.1)
##D 
##D mle.bin <- maxBFGS(fn = mcl.glm, start=as.numeric(psi.binom), print.level=1,
##D                    constraints=list(ineqA=A, ineqB=B),
##D                    mcdata = mc.data2, family = "binom")
## End(Not run)
## Assume we have obtained mle.bin
mle.bin <- list(estimate = c(0.2271854 , 1.6117040, -0.3870856,  2.6525503),
                hessian = matrix(c( -1981.34398, -71.992190,  -79.910745,  -63.451022,
                                   -71.99219, -13.985701,    2.965628,    2.216893,
                                   -79.91074,   2.965628, -251.320742, -176.993087,
                                   -63.45102,   2.216893, -176.993087, -132.575284), 4,4))

## Calculate the variance of the MC-MLE
v.mle.bin <- vmle.glm(mle.bin, mcdata = mc.data2, family = "binom")


## Find the Monte Carlo MLE of beta, given the value of rho and sigma
get.beta.glm(beta0 = psi.binom[-c(1,2)], rho.sig = psi.binom[1:2],
             mcdata = mc.data2, family = c("binom"))



