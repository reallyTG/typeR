library(mcemGLM)


### Name: mcemGLMM
### Title: Generalized Linear Mixed Models Estimation
### Aliases: mcemGLMM
### Keywords: glmm

### ** Examples

## No test: 
# Data set for a logistic model with one binary fixed effects and two 
# possible random effects.
# Initial values and MC iterations are given to speed up the examples 
# but these are not necessary in general.
set.seed(0123210)
data(exdata)

# To fit a model with one random effect
fit.1 <- mcemGLMM(obs ~ x, random = ~ 0 + z1, data = exdata, 
                family = "bernoulli", vcDist = "normal", 
                controlEM = list(MCit = 10000), 
                initial = c(0.27, -0.13, 0.003))
summary(fit.1)

# We can assess convergence by looking at a trace plot of the EM estimates
# and the loglikelihood values
ts.plot(fit.1$mcemEST)
ts.plot(fit.1$QfunVal)

# To fit a model with crossed random effects
fit.crossed <- mcemGLMM(obs ~ x, random = list(~ 0 + z1, ~ 0 + z2), 
                data = exdata, 
                family = "bernoulli", vcDist = "normal", 
                controlEM = list(EMit = 10, MCit = 10000), 
                initial = c(0.28, -0.15, 0.001, 0.4))
summary(fit.crossed)


# To fit a model with crossed random effects
fit.nested <- mcemGLMM(obs ~ x, random = list(~ 0 + z2, ~ 0 + z2:z1), 
                data = exdata, 
                family = "bernoulli", vcDist = "normal", 
                controlEM = list(EMit = 10, MCit = 10000), 
                initial = c(0.31, -0.15, 0.29, 0.27))
summary(fit.nested)

# Fit a Poisson model
fit.pois <- mcemGLMM(obs2 ~ x, random = ~ 0 + z1, data = exdata, 
                family = "poisson", vcDist = "normal", 
                controlEM = list(EMit = 10, MCit = 10000), 
                initial = c(1.95, 0.03, 0.003))
summary(fit.pois)
## End(No test)



