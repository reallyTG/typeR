library(ICAOD)


### Name: bayescomp
### Title: Bayesian Compound DP-Optimal Designs
### Aliases: bayescomp

### ** Examples

##########################################################################
# DP-optimal design for a logitic model with two predictors: with formula
##########################################################################
p <- c(1, -2, 1, -1)
myprior <- uniform(p -1.5, p + 1.5)
myformula1 <- ~exp(b0+b1*x1+b2*x2+b3*x1*x2)/(1+exp(b0+b1*x1+b2*x2+b3*x1*x2))
res1 <- bayescomp(formula = myformula1,
                  predvars = c("x1", "x2"),
                  parvars = c("b0", "b1", "b2", "b3"),
                  family = binomial(),
                  lx = c(-1, -1), ux = c(1, 1),
                  prior = myprior, iter = 1, k = 7,
                  prob = ~1-1/(1+exp(b0 + b1 * x1 + b2 * x2 + b3 * x1 * x2)),
                  alpha = .5, ICA.control = list(rseed = 1366))


## Not run: 
##D   res1 <- iterate(res1, 1000)
##D   plot(res1, sens.bayes.control = list(cubature = list(tol = 1e-3, maxEval = 1000)))
##D   # or use quadrature method
##D   plot(res1, sens_method = "quadrature")
## End(Not run)

##########################################################################
# DP-optimal design for a logitic model with two predictors: with fimfunc
##########################################################################
# The function of the Fisher information matrix for this model is 'FIM_logistic_2pred'
# We should reparameterize it to match the standard of the argument 'fimfunc'
myfim <- function(x, w, param){
  npoint <- length(x)/2
  x1 <- x[1:npoint]
  x2 <- x[(npoint+1):(npoint*2)]
  FIM_logistic_2pred(x1 = x1,x2 = x2, w = w, param = param)
}

## The following function is equivalent to the function created
# by the formula: ~1-1/(1+exp(b0 + b1 * x1 + b2 * x2 + b3 * x1 * x2))
# It returns probability of success given x and param
# x = c(x1, x2) and param = c()

myprob <- function(x, param){
  npoint <- length(x)/2
  x1 <- x[1:npoint]
  x2 <- x[(npoint+1):(npoint*2)]
  b0 <- param[1]
  b1 <- param[2]
  b2 <- param[3]
  b3 <- param[4]
  out <- 1-1/(1+exp(b0 + b1 * x1 + b2 * x2 + b3 * x1 * x2))
  return(out)
}
## Not run: 
##D res2 <- bayescomp(fimfunc = myfim,
##D                   lx = c(-1, -1), ux = c(1, 1),
##D                   prior = myprior, iter = 1000, k = 7,
##D                   prob = myprob, alpha = .5,
##D                   ICA.control = list(rseed = 1366))
##D   plot(res2, sens.bayes.control = list(cubature = list(maxEval = 1000, tol = 1e-4)))
##D   # quadrature with 6 nodes (default)
##D   plot(res2, sens_method = "quadrature")
## End(Not run)





