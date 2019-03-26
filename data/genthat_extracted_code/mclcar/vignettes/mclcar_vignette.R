## ----echo=FALSE----------------------------------------------------------
knitr::opts_chunk$set(prompt = TRUE, comment=NA)

## ------------------------------------------------------------------------
library(mclcar)

## ------------------------------------------------------------------------
set.seed(33)
n.torus <- 10
rho <- 0.2
sigma <- 1
prec <- 1/sigma
beta <- c(1, 1)
XX <- cbind(rep(1, n.torus^2), sample(log(1:n.torus^2)/5))
mydata1 <- CAR.simTorus(n1 = n.torus, n2 = n.torus, rho = rho, prec = prec)

## ------------------------------------------------------------------------
Wmat <- mydata1$W
mydata2 <- CAR.simWmat(rho = rho, prec = prec, W = Wmat)

## ------------------------------------------------------------------------
y <- XX %*% beta + mydata1$X
mydata1$data.vec <- data.frame(y=y, XX[,-1])
mydata3 <- CAR.simLM(pars = c(0.1, 1, 2, 0.5), data = mydata1)

## ------------------------------------------------------------------------
str(mydata1)
#### evaluate the log-likelihood
## without supplying lamdab -- the eigenvalues of W
loglik.dCAR(pars = c(0.1, 1, 0.9, 2.1), data = mydata1)

## with lamda
lambda <- eigen(mydata1$W, symmetric = TRUE, only.values=TRUE)$values
mydata1$lambda <- lambda
loglik.dCAR(pars = c(0.1, 1, 0.9, 2.1), data = mydata1)

## evaluate the profile log-likelihood of rho
ploglik.dCAR(rho = 0.1, data = mydata1)

## given rho = 0.1, find the least square estimates for beta and sigma
get.beta.lm(rho = 0.1, data = mydata1)
sigmabeta(rho = 0.1, data = mydata1)

## find the maximum pseudo-likelihood estimates
(psi1 <- mple.dCAR(data = mydata1))

## ------------------------------------------------------------------------
mydata4 <- CAR.simGLM(method="binom", n=c(10,10),
                      pars = c(rho, sigma, beta),
                      Xs=XX, n.trial = 5)
mydata5 <- CAR.simGLM(method="poisson", n=c(10, 10),
                      pars = c(rho, sigma, beta), Xs=XX)
str(mydata5)

## ------------------------------------------------------------------------
#### Prepare the Monte Carlo samples for the direct CAR models
mcdata1 <- mcl.prep.dCAR(psi = psi1, n.samples = 500, data = mydata1)

## ----eval=FALSE----------------------------------------------------------
#  Z.S0 <- CAR.simWmat(psi1[1], 1/psi1[2], mydata4$W) # initial value
#  mc.cons <- list(method = "mala") # control the MCMC algorithm
#  simZy <- postZ(data = mydata4, Z.start = Z.S0, psi = psi1,
#                 family = "binom", mcmc.control = mc.cons,
#                 plots = TRUE) # diagnostic plots for the MCMC
#  

## ------------------------------------------------------------------------
mc.BinData <- mcl.prep.glm(data = mydata4, family = "binom", psi = psi1,
                           pilot.plot = FALSE, plot.diag = TRUE)

## ------------------------------------------------------------------------
## the Monte Carlo likelihoods at the true value
pars.t <- c(rho, sigma, beta)
mcl.dCAR(pars.t, data = mydata1, simdata = mcdata1, Evar = TRUE)
mcl.glm(pars.t, family = "binom",  mcdata = mc.BinData, Evar = FALSE)
## When Evar = TRUE the function returns the Monte Carlo likelihood,
## an variance estimate of the Monte Carlo likelihood

## ------------------------------------------------------------------------
iter.mcmle <- OptimMCL(data = mydata1, psi0 = psi1, family = "gauss",
                       control = list(mc.var = FALSE, verbose = FALSE))
summary(iter.mcmle, family = "gauss", mc.covar=FALSE)

## similar syntax for Binomial data but take longer time to run
## iter.mcmle.b <- OptimMCL(data = mydata4, psi0 = psi1, family = "binom",
##                       control = list(mc.var = TRUE, verbose = TRUE))

## ----eval=FALSE----------------------------------------------------------
#  exacts = list(eval = TRUE, rho = c(-0.25, 0.25),
#  sigma = c(0.5, 2), length = 100)

## ----fig.show='hide', results="hide"-------------------------------------
rsm.mcmle1 <- rsmMCL(data = mydata1, psi0 = c(-0.1, sigmabeta(-0.1, mydata1)),
                     family = "gauss",
                     control = list(n.iter= 10, trace.all = TRUE))

## ----eval=FALSE----------------------------------------------------------
#  rsm.mcmle2 <- rsmMCL(data = mydata5, psi0 = c(0, 1, 2, 2), family = "poisson",
#                      control = list(n.iter = 20, trace.all = TRUE))

## ------------------------------------------------------------------------
summary(rsm.mcmle1, family = "gauss", mc.covar=FALSE)

## ------------------------------------------------------------------------
plot(rsm.mcmle1, family = "gauss", trace.all = FALSE)

## ------------------------------------------------------------------------
plot(rsm.mcmle1, family = "gauss")

