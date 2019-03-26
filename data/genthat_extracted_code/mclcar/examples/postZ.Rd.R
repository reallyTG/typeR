library(mclcar)


### Name: postZ
### Title: Sampling the CAR latent variables given the Binomial or Poisson
###   observations in glm models.
### Aliases: postZ
### Keywords: MCMC Spatial

### ** Examples

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
library(spdep)
data.glm <- data.frame(y=mydata2$y, mydata2$covX[,-1])
fit.glm <- glm(cbind(y, nb-mydata2$y) ~ .,data = data.glm, family=binomial)
## estimate sigma and rho, transform the binomial to Gaussian by logit
logitp <- log((mydata2$y+0.5)/(mydata2$n.trial - mydata2$y + 0.5))
data.splm <- data.frame(y=logitp, mydata2$covX[,-1])
listW <- mat2listw(mydata2$W)
fit.splm <- spautolm(y~., data = data.splm, listw=listW, family = "CAR")
pars1 <- c(fit.splm$lambda, fit.splm$fit$s2, coef(fit.glm))

## Sample form importance distribution with psi = pars1
mc.control <- list(N.Zy = 1e3, Scale = 1.65/(n.torus^(2/6)), thin = 5,
                   burns = 5e2, method = "mala", scale.fixed = TRUE)
## Binomial
Z.S0 <- CAR.simWmat(pars1[1], 1/pars1[2], mydata2$W)
simZy <- postZ(data = mydata2, Z.start = Z.S0, psi = pars1,
               family = "binom", mcmc.control = mc.control, plots =
TRUE)




