library(stsm)


### Name: barrier.eval
### Title: Barrier Term in the Likelihood Function
### Aliases: barrier.eval
### Keywords: nonlinear

### ** Examples

# define local level plus seasonal model for a simulated time series
# and evaluate the barrier term for some parameter values
# the barrier term in the second model is higher since the variances 
# are closer to the lower bounds (zero)
data("llmseas")
pars <- c("var1" = 30, "var2" = 1, "var3" = 10)
m1 <- stsm.model(model = "llm+seas", y = llmseas, pars = pars)
bar1 <- barrier.eval(m1, type = "2", mu = 3)
bar1$barrier

pars <- c("var1" = 0.3, "var2" = 0.01, "var3" = 0.1)
m2 <- stsm.model(model = "llm+seas", y = llmseas, pars = pars)
bar2 <- barrier.eval(m2, type = "2", mu = 3)
bar2$barrier

# the barrier term is added to the negative of the likelihood function
# that will be the objective function to be minimized,
# value of minus log-likelihood without barrier
mloglik.fd(model = m2)
# adding a barrier term
mloglik.fd(model = m2) + bar2$barrier
mloglik.fd(model = m2, barrier = list(type = "2", mu = 3))



