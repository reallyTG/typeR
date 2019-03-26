library(ICAOD)


### Name: bayes
### Title: Bayesian D-Optimal Designs
### Aliases: bayes

### ** Examples

#############################################
# Two parameter logistic model: uniform prior
#############################################
# set the unfirom prior
uni <- uniform(lower =  c(-3, .1), upper = c(3, 2))
# set the logistic model with formula
res1 <- bayes(formula = ~1/(1 + exp(-b *(x - a))),
              predvars = "x", parvars = c("a", "b"),
              family = binomial(), lx = -3, ux = 3,
              k =  5, iter = 1, prior = uni,
              ICA.control = list(rseed = 1366))

## Not run: 
##D   res1 <- iterate(res1, 500)
##D   plot(res1)
## End(Not run)
# You can also use your  Fisher information matrix (FIM) if you think it is faster!
## Not run: 
##D   bayes(fimfunc = FIM_logistic, lx = -3, ux = 3, k =  5, iter = 500,
##D         prior = uni, ICA.control = list(rseed = 1366))
## End(Not run)

# with fixed x
## Not run: 
##D   res1.1 <- bayes(formula = ~1/(1 + exp(-b *(x - a))),
##D                   predvars = "x", parvars = c("a", "b"),
##D                   family = binomial(), lx = -3, ux = 3,
##D                   k =  5, iter = 100, prior = uni,
##D                   x = c( -3, -1.5, 0,  1.5, 3),
##D                   ICA.control = list(rseed = 1366))
##D   plot(res1.1)
##D   # not optimal
## End(Not run)

# with quadrature formula
## Not run: 
##D   res1.2 <- bayes(formula = ~1/(1 + exp(-b *(x - a))),
##D                 predvars = "x", parvars = c("a", "b"),
##D                 family = binomial(), lx = -3, ux = 3,
##D                 k =  5, iter = 1, prior = uni,
##D                 crt_method = "quadrature",
##D                 ICA.control = list(rseed = 1366))
##D   res1.2 <- iterate(res1.2, 500)
##D   plot(res1.2) # not optimal
##D   # compare it with res1 that was found by automatic integration
##D   plot(res1)
##D 
##D   # we increase the number of quadrature nodes
##D   res1.3 <- bayes(formula = ~1/(1 + exp(-b *(x - a))),
##D                   predvars = "x", parvars = c("a", "b"),
##D                   family = binomial(), lx = -3, ux = 3,
##D                   k =  5, iter = 1, prior = uni,
##D                   crt_method = "quadrature",
##D                   crt.bayes.control = list(quadrature = list(level = 9)),
##D                   ICA.control = list(rseed = 1366))
##D   res1.3 <- iterate(res1.3, 500)
##D   plot(res1.3)
##D   # by automatic integration (crt_method = "cubature"),
##D   #  we did not need to worry about the number of nodes.
## End(Not run)
###############################################
# Two parameter logistic model: normal prior #1
###############################################
# defining the normal prior #1
norm1 <- normal(mu =  c(0, 1),
                sigma = matrix(c(1, -0.17, -0.17, .5), nrow = 2),
                lower =  c(-3, .1), upper = c(3, 2))
## Not run: 
##D   # initializing
##D   res2 <- bayes(formula = ~1/(1 + exp(-b *(x - a))), predvars = "x", parvars = c("a", "b"),
##D                 family = binomial(), lx = -3, ux = 3, k =  4, iter = 1, prior = norm1,
##D                 ICA.control = list(rseed = 1366))
##D   res2 <- iterate(res2, 500)
##D   plot(res2)
## End(Not run)

###############################################
# Two parameter logistic model: normal prior #2
###############################################
# defining the normal prior #1
norm2 <- normal(mu =  c(0, 1),
                sigma = matrix(c(1, 0, 0, .5), nrow = 2),
                lower =  c(-3, .1), upper = c(3, 2))
## Not run: 
##D   # initializing
##D   res3 <- bayes(formula = ~1/(1 + exp(-b *(x - a))), predvars = "x", parvars = c("a", "b"),
##D                 family = binomial(), lx = -3, ux = 3, k =  4, iter = 1, prior = norm2,
##D                 ICA.control = list(rseed = 1366))
##D 
##D   res3 <- iterate(res3, 700)
##D   plot(res3, sens.bayes.control = list(cubature = list(maxEval = 3000, tol = 1e-4),
##D                                        optslist = list(maxeval = 3000)))
## End(Not run)


######################################################
# Two parameter logistic model: skewed normal prior #1
######################################################
skew1 <- skewnormal(xi = c(0, 1),
                    Omega = matrix(c(1, -0.17, -0.17, .5), nrow = 2),
                    alpha = c(1, 0), lower =  c(-3, .1), upper = c(3, 2))
## Not run: 
##D   res4 <- bayes(formula = ~1/(1 + exp(-b *(x - a))), predvars = "x", parvars = c("a", "b"),
##D                 family = binomial(), lx = -3, ux = 3, k =  4, iter = 700, prior = skew1,
##D                 ICA.control = list(rseed = 1366, ncount = 60))
##D   plot(res4, sens.bayes.control = list(cubature = list(maxEval = 3000, tol = 1e-4),
##D                                        optslist = list(maxeval = 3000)))
## End(Not run)


######################################################
# Two parameter logistic model: skewed normal prior #2
######################################################
skew2 <- skewnormal(xi = c(0, 1),
                    Omega = matrix(c(1, -0.17, -0.17, .5), nrow = 2),
                    alpha = c(-1, 0), lower =  c(-3, .1), upper = c(3, 2))
## Not run: 
##D   res5 <- bayes(formula = ~1/(1 + exp(-b *(x - a))), predvars = "x", parvars = c("a", "b"),
##D                 family = binomial(), lx = -3, ux = 3, k =  4, iter = 700, prior = skew2,
##D                 ICA.control = list(rseed = 1366, ncount = 60))
##D   plot(res5, sens.bayes.control = list(cubature = list(maxEval = 3000, tol = 1e-4),
##D                                        optslist = list(maxeval = 3000)))
## End(Not run)

###############################################
# Two parameter logistic model: t student prior
###############################################
# set the prior
stud <- student(mean =  c(0, 1), S   = matrix(c(1, -0.17, -0.17, .5), nrow = 2),
                df = 3, lower =  c(-3, .1), upper = c(3, 2))
## Not run: 
##D   res6 <- bayes(formula = ~1/(1 + exp(-b *(x - a))), predvars = "x", parvars = c("a", "b"),
##D                 family = binomial(), lx = -3, ux = 3, k =  5, iter = 500, prior = stud,
##D                 ICA.control = list(ncount = 50, rseed = 1366))
##D   plot(res6)
## End(Not run)
# not bad, but to find a very accurate designs we increase
# the ncount to 200 and repeat the optimization
## Not run: 
##D   res6 <- bayes(formula = ~1/(1 + exp(-b *(x - a))),
##D                 predvars = "x", parvars = c("a", "b"),
##D                 family = binomial(), lx = -3, ux = 3, k =  5, iter = 1000, prior = stud,
##D                 ICA.control = list(ncount = 200,  rseed = 1366))
##D   plot(res6)
## End(Not run)


##############################################
# 4-parameter sigmoid Emax model: unform prior
##############################################
lb <- c(4, 11, 100, 5)
ub <- c(8, 15, 130, 9)
## Not run: 
##D   res7 <- bayes(formula = ~ theta1 + (theta2 - theta1)*(x^theta4)/(x^theta4 + theta3^theta4),
##D                 predvars = c("x"), parvars = c("theta1", "theta2", "theta3", "theta4"),
##D                 lx = .001, ux = 500, k = 5, iter = 200, prior = uniform(lb, ub),
##D                 ICA.control = list(rseed = 1366, ncount = 60))
##D   plot(res7, sens.bayes.control = list(cubature = list(maxEval = 500, tol = 1e-3),
##D                                        optslist = list(maxeval = 500)))
## End(Not run)

#######################################################################
# 2-parameter Cox Proportional-Hazards Model for type one cenosred data
#######################################################################
# The Fisher information matrix is available here with name FIM_2par_exp_censor1
# However, we should reparameterize the function to match the standard of the argument 'fimfunc'
myfim <- function(x, w, param)
  FIM_2par_exp_censor1(x = x, w = w, param = param, tcensor = 30)
## Not run: 
##D   res8 <- bayes(fimfunc = myfim, lx = 0, ux = 1, k = 4,
##D                 iter = 1, prior = uniform(c(-11, -11), c(11, 11)),
##D                 ICA.control = list(rseed = 1366))
##D 
##D   res8 <- iterate(res8, 200)
##D   plot(res8, sens.bayes.control = list(cubature = list(maxEval = 500, tol = 1e-3),
##D                                        optslist = list(maxeval = 500)))
## End(Not run)


#######################################################################
# 2-parameter Cox Proportional-Hazards Model for random cenosred data
#######################################################################
# The Fisher information matrix is available here with name FIM_2par_exp_censor2
# However, we should reparameterize the function to match the standard of the argument 'fimfunc'
myfim <- function(x, w, param)
  FIM_2par_exp_censor2(x = x, w = w, param = param, tcensor = 30)
## Not run: 
##D   res9 <- bayes(fimfunc = myfim, lx = 0, ux = 1, k = 2,
##D                 iter = 200, prior = uniform(c(-11, -11), c(11, 11)),
##D                 ICA.control = list(rseed = 1366))
##D   plot(res9, sens.bayes.control = list(cubature = list(maxEval = 100, tol = 1e-3),
##D                                        optslist = list(maxeval = 100)))
## End(Not run)

#################################
# Weibull model: Uniform prior
################################
# see Dette, H., & Pepelyshev, A. (2008).
# Efficient experimental designs for sigmoidal growth models.
# Journal of statistical planning and inference, 138(1), 2-17.

## See how we fixed a some parameters in Bayesian designs
## Not run: 
##D   res10 <- bayes(formula = ~a - b * exp(-lambda * t ^h),
##D                  predvars = c("t"),
##D                  parvars = c("a=1", "b=1", "lambda", "h=1"),
##D                  lx = .00001, ux = 20,
##D                  prior = uniform(.5, 2.5), k = 5, iter = 400,
##D                  ICA.control = list(rseed = 1366))
##D   plot(res10)
## End(Not run)

#################################
# Weibull model: Normal prior
################################
norm3 <- normal(mu = 1, sigma = .1, lower = .5, upper = 2.5)
res11 <- bayes(formula = ~a - b * exp(-lambda * t ^h),
               predvars = c("t"),
               parvars = c("a=1", "b=1", "lambda", "h=1"),
               lx = .00001, ux = 20, prior = norm3, k = 4, iter = 1,
               ICA.control = list(rseed = 1366))

## Not run: 
##D   res11 <- iterate(res11, 400)
##D   plot(res11)
## End(Not run)

#################################
# Richards model: Normal prior
#################################
norm4 <- normal(mu = c(1, 1), sigma = matrix(c(.2, 0.1, 0.1, .4), 2, 2),
                lower = c(.4, .4), upper = c(1.6, 1.6))
## Not run: 
##D   res12 <- bayes(formula = ~a/(1 + b * exp(-lambda*t))^h,
##D                  predvars = c("t"),
##D                  parvars = c("a=1", "b", "lambda", "h=1"),
##D                  lx = .00001, ux = 10,
##D                  prior = norm4,
##D                  k = 5, iter = 400,
##D                  ICA.control = list(rseed = 1366))
##D   plot(res12, sens.bayes.control = list(cubature = list(maxEval = 1000, tol = 1e-3),
##D                                         optslist = list(maxeval = 1000)))
##D   ## or we can use the quadrature formula to plot the derivative function
##D   plot(res12,sens_method = "quadrature",
##D        sens.bayes.control = list(optslist = list(maxeval = 1000)))
##D 
## End(Not run)

#################################
# Exponential model: Uniform prior
#################################
res13 <- bayes(formula = ~a + exp(-b*x), predvars = "x",
               parvars = c("a = 1", "b"),
               lx = 0.0001, ux = 1,
               prior = uniform(lower = 1, upper = 20),
               iter = 1, k = 3,
               ICA.control= list(rseed = 100))
## Not run: 
##D   res13 <- iterate(res13, 300)
##D   plot(res13)
## End(Not run)

#################################
# Power logistic model
#################################
# See, Duarte, B. P., & Wong, W. K. (2014).
# A Semidefinite Programming based approach for finding
# Bayesian optimal designs for nonlinear models
uni1 <- uniform(lower = c(-.3, 6, .5), upper = c(.3, 8, 1))
## Not run: 
##D   res14 <- bayes(formula = ~1/(1 + exp(-b *(x - a)))^s, predvars = "x",
##D                  parvars = c("a", "b", "s"),
##D                  lx = -1, ux = 1, prior = uni1, k = 5, iter = 1)
##D   res14 <- iterate(res14, 300)
##D   plot(res14)
## End(Not run)

############################################################################
# A two-variable generalized linear model with a gamma distributed response
############################################################################
lb <- c(.5, 0, 0, 0, 0, 0)
ub <- c(2, 1, 1, 1, 1, 1)
myformula1 <- ~beta0+beta1*x1+beta2*x2+beta3*x1^2+beta4*x2^2+beta5*x1*x2
## Not run: 
##D   res15 <- bayes(formula = myformula1,
##D                  predvars = c("x1", "x2"), parvars = paste("beta", 0:5, sep = ""),
##D                  family = Gamma(),
##D                  lx = rep(0, 2), ux = rep(1, 2),
##D                  prior = uniform(lower = lb, upper = ub),
##D                  k = 7,iter = 1, ICA.control = list(rseed = 1366))
##D   res14 <- iterate(res14, 500)
##D   plot(res14, sens.bayes.control = list(cubature = list(maxEval = 5000, tol = 1e-4),
##D                                         optslist = list(maxeval = 3000)))
## End(Not run)

#################################
# Three parameter logistic model
#################################

sigma1 <- matrix(-0.1, nrow = 3, ncol = 3)
diag(sigma1) <- c(.5, .4, .1)
norm5 <- normal(mu =  c(0, 1, .2), sigma = sigma1,
                lower =  c(-3, .1, 0), upper = c(3, 2, .7))
## Not run: 
##D   res16 <- bayes(formula = ~ c + (1-c)/(1 + exp(-b *(x - a))), predvars = "x",
##D                  parvars = c("a", "b", "c"),
##D                  family = binomial(), lx = -3, ux = 3,
##D                  k =  4, iter = 500, prior = norm5,
##D                  ICA.control = list(rseed = 1366, ncount = 50),
##D                  crt.bayes.control = list(cubature = list(maxEval = 2500, tol = 1e-4)))
##D   plot(res16, sens.bayes.control = list(cubature = list(maxEval = 3000, tol = 1e-4),
##D                                         optslist = list(maxeval = 3000)))
##D   # took 925 second on my system
## End(Not run)





