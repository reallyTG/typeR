library(mclcar)


### Name: mclcar-package
### Title: Estimating Conditional Auto-Regressive (CAR) Models using Monte
###   Carlo Likelihood Methods
### Aliases: mclcar-package mclcar
### Keywords: package

### ** Examples

#### Example 1: iterative optimising the Monte Carlo likelihood
#######################################################################
system.time({
set.seed(33)
n.torus <- 8
nb <- 30
rho <- 0.2
sigma <- 1.5
beta <- c(1, 1)
pars.true <- c(rho, sigma, beta)
X0 <- cbind(rep(1, n.torus^2), sample(log(1:n.torus^2)/5))
mydata2 <- CAR.simGLM(method = "binom", n = c(n.torus, n.torus), pars = pars.true,
                      Xs = as.matrix(X0), n.trial = nb)

## use a glm to find initial values for the importance sampler
data.glm <- data.frame(y=mydata2$y, mydata2$covX[,-1])
fit.glm <- glm(cbind(y, nb-mydata2$y) ~ .,data = data.glm, family=binomial)
library(spdep)
logitp <- log((mydata2$y+0.5)/(mydata2$n.trial - mydata2$y + 0.5))
data.splm <- data.frame(y=logitp, mydata2$covX[,-1])
listW <- mat2listw(mydata2$W)
fit.splm <- spautolm(y~., data = data.splm, listw=listW, family = "CAR")
pars1 <- c(fit.splm$lambda, fit.splm$fit$s2, coef(fit.glm))

 ## Use the iterative procedure to find the MC-MLE
 iter.mcmle <- OptimMCL(data = mydata2, psi0 = pars1, family = "binom",
                        control = list(n.iter = 1, mc.var = TRUE),
                        mc.control = list(N.Zy = 1e3, Scale = 1.65/(n.torus^(2/6)), thin = 5,
                                          burns = 5e2, method = "mala", scale.fixed = TRUE))
summary(iter.mcmle, family = "binom", mc.covar=TRUE)

#### Example 2: RSM optimising the Monte Carlo likelihood
#######################################################################
mydata3 <- CAR.simGLM(method = "poisson", n = c(n.torus, n.torus),
                      pars = pars.true, Xs =as.matrix(X0))
## Fit by rsm
rsm.mcmle <- rsmMCL(data = mydata3, psi0 = c(0, 1, 2, 2), family = "poisson",
                    control = list(n.iter = 1, trace.all = TRUE),
                    mc.control = list(N.Zy = 1e3, Scale = 1.65/(n.torus^(2/6)),
                                       thin = 5, burns = 5e2,
                                       method = "mala", scale.fixed = TRUE))
summary(rsm.mcmle, family = "poisson",  mc.covar=TRUE)
})



