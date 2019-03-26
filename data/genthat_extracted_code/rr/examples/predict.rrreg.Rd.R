library(rr)


### Name: predict.rrreg
### Title: Predicted Probabilities for Randomized Response Regression
### Aliases: predict.rrreg
### Keywords: fitted predicted probabilities values

### ** Examples


## Not run: 
##D data(nigeria)
##D 
##D set.seed(1)
##D 
##D ## Define design parameters
##D p <- 2/3  # probability of answering honestly in Forced Response Design
##D p1 <- 1/6 # probability of forced 'yes'
##D p0 <- 1/6 # probability of forced 'no'
##D 
##D ## Fit linear regression on the randomized response item of 
##D ## whether citizen respondents had direct social contacts to armed groups
##D 
##D rr.q1.reg.obj <- rrreg(rr.q1 ~ cov.asset.index + cov.married + I(cov.age/10) + 
##D                       I((cov.age/10)^2) + cov.education + cov.female,   
##D                       data = nigeria, p = p, p1 = p1, p0 = p0, 
##D                       design = "forced-known")
##D 
##D ## Generate the mean predicted probability of having social contacts to 
##D ## armed groups across respondents using quasi-Bayesian simulations. 
##D 
##D rr.q1.reg.pred <- predict(rr.q1.reg.obj, given.y = FALSE, 
##D                                 avg = TRUE, quasi.bayes = TRUE, 
##D                                 n.sims = 10000)
##D 
##D ## Replicates Table 3 in Blair, Imai, and Zhou (2014)
## End(Not run)




