library(rr)


### Name: predict.rrreg.predictor
### Title: Predicted Probabilities for Randomized Response as a Regression
###   Predictor
### Aliases: predict.rrreg.predictor
### Keywords: fitted predicted probabilities values

### ** Examples


## Not run: 
##D data(nigeria)
##D 
##D ## Define design parameters
##D 
##D set.seed(44)
##D 
##D p <- 2/3  # probability of answering honestly in Forced Response Design
##D p1 <- 1/6 # probability of forced 'yes'
##D p0 <- 1/6 # probability of forced 'no'
##D 
##D ## Fit joint model of responses to an outcome regression of joining a civic 
##D ## group and the randomized response item of having a militant social connection
##D 
##D rr.q1.pred.obj <- 
##D     rrreg.predictor(civic ~ cov.asset.index + cov.married + I(cov.age/10) + 
##D               I((cov.age/10)^2) + cov.education + cov.female 
##D               + rr.q1, rr.item = "rr.q1", parstart = FALSE, estconv = TRUE,
##D               data = nigeria, verbose = FALSE, optim = TRUE,
##D               p = p, p1 = p1, p0 = p0, design = "forced-known")
##D 
##D ## Generate predicted probabilities for the likelihood of joining 
##D ## a civic group across respondents using quasi-Bayesian simulations. 
##D 
##D rr.q1.rrreg.predictor.pred <- predict(rr.q1.pred.obj, 
##D                                  avg = TRUE, quasi.bayes = TRUE, 
##D                                  n.sims = 10000)
##D 
## End(Not run)



