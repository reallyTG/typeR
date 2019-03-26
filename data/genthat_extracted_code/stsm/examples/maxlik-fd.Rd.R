library(stsm)


### Name: maxlik.fd
### Title: Maximization of the Spectral Likelihood Function
### Aliases: maxlik.fd maxlik.fd.optim maxlik.fd.scoring maxclik.fd.scoring
### Keywords: ts models nonlinear

### ** Examples

# fit the local level plus seasonal model to a 
# sample simulated series
# further examples and options can be explored in the 
# script files 'sim-llmseas-ml-fd.R' and 'sim-llmseas-mcl-fd.R'
# available in the 'inst' folder of the source package
data("llmseas")

# initial parameters and 'stsm' model
initpars <- c(var1 = 1, var2 = 1, var3 = 1)
m <- stsm.model(model = "llm+seas", y = llmseas, pars = initpars)

# Newton-Raphson algorithm (analytical Hessian)
res1 <- maxlik.fd.scoring(m = m, step = NULL, 
  information = "observed", control = list(maxit = 100, tol = 0.001))
res1

# Scoring algorithm (information matrix)
res2 <- maxlik.fd.scoring(m = m, step = NULL, 
  information = "expected", control = list(maxit = 100, tol = 0.001))
res2

# wrapper function for 'optim()' in the 'stats' package
res3 <- maxlik.fd.optim(m, method = "L-BFGS-B", gr = "analytical")
res3

# concentrating one of the parameters
# the model must be first defined accordingly, here 'var1', i.e.,
# the variance of the disturbance in the observation equation
# is concentrated, its standard error is reported as 'NA'
mc <- stsm.model(model = "llm+seas", y = llmseas, 
  pars = initpars[-1], cpar = initpars[1])
res4 <- maxclik.fd.scoring(m = mc, step = NULL, 
    information = "observed", control = list(maxit = 100, tol = 0.001))
res4



