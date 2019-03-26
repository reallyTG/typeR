library(ICAOD)


### Name: locallycomp
### Title: Locally DP-Optimal Designs
### Aliases: locallycomp

### ** Examples

## Here we produce the results of Table 2 in in McGree and Eccleston (2008)
# For D- and P-efficiency see, ?leff and ?peff

p <- c(1, -2, 1, -1)
prior4.4 <- uniform(p -1.5, p + 1.5)
formula4.4 <- ~exp(b0+b1*x1+b2*x2+b3*x1*x2)/(1+exp(b0+b1*x1+b2*x2+b3*x1*x2))
prob4.4 <- ~1-1/(1+exp(b0 + b1 * x1 + b2 * x2 + b3 * x1 * x2))
predvars4.4 <-  c("x1", "x2")
parvars4.4 <- c("b0", "b1", "b2", "b3")
lb <- c(-1, -1)
ub <- c(1, 1)


# set checkfreq = Inf to ask for equivalence theorem at final step.
res.0 <- locallycomp(formula = formula4.4, predvars = predvars4.4, parvars = parvars4.4,
                     family = binomial(), prob = prob4.4, lx = lb, ux = ub,
                     alpha = 0, k = 1, inipars = p, iter = 10,
                     ICA.control = ICA.control(checkfreq = Inf))

## Not run: 
##D res.25 <- locallycomp(formula = formula4.4, predvars = predvars4.4, parvars = parvars4.4,
##D                       family = binomial(), prob = prob4.4, lx = lb, ux = ub,
##D                       alpha = .25, k = 4, inipars = p, iter = 350,
##D                       ICA.control = ICA.control(checkfreq = Inf))
##D 
##D res.5 <- locallycomp(formula = formula4.4, predvars = predvars4.4, parvars = parvars4.4,
##D                      family = binomial(), prob = prob4.4, lx = lb, ux = ub,
##D                      alpha = .5, k = 4, inipars = p, iter = 350,
##D                      ICA.control = ICA.control(checkfreq = Inf))
##D res.75 <- locallycomp(formula = formula4.4, predvars = predvars4.4, parvars = parvars4.4,
##D                       family = binomial(), prob = prob4.4, lx = lb, ux = ub,
##D                       alpha = .75, k = 4, inipars = p, iter = 350,
##D                       ICA.control = ICA.control(checkfreq = Inf))
##D 
##D res.1 <- locallycomp(formula = formula4.4, predvars = predvars4.4, parvars = parvars4.4,
##D                      family = binomial(), prob = prob4.4, lx = lb, ux = ub,
##D                      alpha = 1, k = 4, inipars = p, iter = 350,
##D                      ICA.control = ICA.control(checkfreq = Inf))
##D 
##D #### computing the D-efficiency
##D # locally D-optimal design is locally DP-optimal design when alpha = 1.
##D 
##D leff(formula = formula4.4, predvars = predvars4.4, parvars = parvars4.4, family = binomial(),
##D      x = res.0$evol[[10]]$x, w = res.0$evol[[10]]$w,
##D      inipars = p,
##D      xopt = res.1$evol[[350]]$x, wopt = res.1$evol[[350]]$w)
##D 
##D leff(formula = formula4.4, predvars = predvars4.4, parvars = parvars4.4, family = binomial(),
##D      x = res.25$evol[[350]]$x, w = res.25$evol[[350]]$w,
##D      inipars = p,
##D      xopt = res.1$evol[[350]]$x, wopt = res.1$evol[[350]]$w)
##D 
##D leff(formula = formula4.4, predvars = predvars4.4, parvars = parvars4.4, family = binomial(),
##D      x = res.5$evol[[350]]$x, w = res.5$evol[[350]]$w,
##D      inipars = p,
##D      xopt = res.1$evol[[350]]$x, wopt = res.1$evol[[350]]$w)
##D 
##D 
##D leff(formula = formula4.4, predvars = predvars4.4, parvars = parvars4.4, family = binomial(),
##D      x = res.75$evol[[350]]$x, w = res.75$evol[[350]]$w,
##D      inipars = p,
##D      xopt = res.1$evol[[350]]$x, wopt = res.1$evol[[350]]$w)
##D 
##D 
##D 
##D #### computing the P-efficiency
##D # locally p-optimal design is locally DP-optimal design when alpha = 0.
##D 
##D leff(formula = formula4.4, predvars = predvars4.4, parvars = parvars4.4, family = binomial(),
##D      xopt = res.0$evol[[10]]$x, wopt = res.0$evol[[10]]$w,
##D      prob = prob4.4,
##D      type = "PA",
##D      inipars = p,
##D      x = res.25$evol[[350]]$x, w = res.25$evol[[350]]$w)
##D 
##D leff(formula = formula4.4, predvars = predvars4.4, parvars = parvars4.4, family = binomial(),
##D      xopt = res.0$evol[[10]]$x, wopt = res.0$evol[[10]]$w,
##D      prob = prob4.4,
##D      inipars = p,
##D      type = "PA",
##D      x = res.5$evol[[350]]$x, w = res.5$evol[[350]]$w)
##D 
##D leff(formula = formula4.4, predvars = predvars4.4, parvars = parvars4.4, family = binomial(),
##D      xopt = res.0$evol[[10]]$x, wopt = res.0$evol[[10]]$w,
##D      prob = prob4.4,
##D      inipars = p,
##D      type = "PA",
##D      x = res.75$evol[[350]]$x, w = res.75$evol[[350]]$w)
##D 
##D 
##D leff(formula = formula4.4, predvars = predvars4.4, parvars = parvars4.4, family = binomial(),
##D      xopt = res.0$evol[[10]]$x, wopt = res.1$evol[[10]]$w,
##D      prob = prob4.4,
##D      type = "PA",
##D      inipars = p,
##D      x = res.1$evol[[350]]$x, w = res.1$evol[[350]]$w)
##D 
##D 
## End(Not run)



