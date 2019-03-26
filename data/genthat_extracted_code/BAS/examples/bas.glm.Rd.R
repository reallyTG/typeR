library(BAS)


### Name: bas.glm
### Title: Bayesian Adaptive Sampling Without Replacement for Variable
###   Selection in Generalized Linear Models
### Aliases: bas.glm
### Keywords: GLM regression

### ** Examples


library(MASS)
data(Pima.tr)


# enumeration  with default method="BAS"
pima.cch = bas.glm(type ~ ., data=Pima.tr, n.models= 2^7,
              method="BAS",
              betaprior=CCH(a=1, b=532/2, s=0), family=binomial(),
              modelprior=beta.binomial(1,1))

summary(pima.cch)
image(pima.cch)

pima.robust = bas.glm(type ~ ., data=Pima.tr, n.models= 2^7,
              method="MCMC", MCMC.iterations=20000,
              betaprior=robust(), family=binomial(),
              modelprior=beta.binomial(1,1))

pima.BIC = bas.glm(type ~ ., data=Pima.tr, n.models= 2^7,
              method="BAS+MCMC", MCMC.iterations=1000,
              betaprior=bic.prior(), family=binomial(),
              modelprior=uniform())
# Poisson example
if(requireNamespace("glmbb", quietly=TRUE)) {
  data(crabs, package='glmbb')
  #short run for illustration
  crabs.bas = bas.glm(satell ~ color*spine*width + weight, data=crabs,
                      family=poisson(),
                      betaprior=EB.local(), modelprior=uniform(),
                      method='MCMC', n.models=2^10, MCMC.iterations=10000,
                      prob.rw=.95)
}



