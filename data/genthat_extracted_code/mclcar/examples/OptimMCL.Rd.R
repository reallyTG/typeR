library(mclcar)


### Name: OptimMCL
### Title: Iterative procedure for maximising the Monte Carlo likelihood
### Aliases: OptimMCL
### Keywords: Monte Carlo likelihood CAR Spatial

### ** Examples


## Take long time to run
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
## !!!NOTE: the example below is only an illustration of usage
## users should increase the number of iterations and MCMC samples
## to get convergence results.
iter.mcmle <- OptimMCL(data = mydata2, psi0 = pars1, family = "binom",
                       control = list(n.iter = 1, mc.var = TRUE),
                       mc.control = list(N.Zy = 1e3, Scale = 1.65/(n.torus^(2/6)), thin = 5,
                   burns = 5e2, method = "mala", scale.fixed = TRUE))
summary(iter.mcmle, family = "binom", mc.covar=TRUE)



