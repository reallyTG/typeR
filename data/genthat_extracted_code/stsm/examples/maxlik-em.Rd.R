library(stsm)


### Name: maxlik.em
### Title: Maximization of the Time Domain Likelihood Function via the
###   Expectation-Maximization Algorithm
### Aliases: maxlik.em
### Keywords: ts models nonlinear

### ** Examples

# fit a local level plus seasonal model to a simulated sample series
# using the three versions of the EM algorithm
# the same solution is found by all versions (up to a tolerance)
# the modified version converges in fewer iterations, yet it involves 
# more computations
data("llmseas")
m <- stsm.model(model = "llm+seas", y = llmseas, 
  pars = c(var1 = 1, var2 = 1, var3 = 1))

# original version
res1 <- maxlik.em(m, type = "standard", 
  tol = 0.001, maxiter = 350, kfconv = c(0.01, 10, 1))
res1$pars
res1$iter

# modified version
res2 <- maxlik.em(m, type = "modified", 
  tol = 0.001, maxiter = 250, kfconv = c(0.01, 10, 1),  
  ur.maxiter = 1000, r.interval = c(0.001, var(m@y)*0.75, 20))
res2$pars
res2$iter
res2$calls.v1

# mixture, the modified version is run every 10 iterations
# starting in the third one
res3 <- maxlik.em(m, type = "mix", 
  tol = 0.001, maxiter = 250, kfconv = c(0.01, 10, 1),  
  ur.maxiter = 1000, r.interval = c(0.001, var(m@y)*0.75, 20),
  mod.steps = seq(3, 200, 10))
res3$pars
res3$iter
res3$calls.v1



