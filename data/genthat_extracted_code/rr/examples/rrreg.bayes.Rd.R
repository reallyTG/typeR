library(rr)


### Name: rrreg.bayes
### Title: Bayesian Randomized Response Regression
### Aliases: rrreg.bayes

### ** Examples

 
data(nigeria)
 
## Define design parameters
p <- 2/3  # probability of answering honestly in Forced Response Design
p1 <- 1/6 # probability of forced 'yes'
p0 <- 1/6 # probability of forced 'no'

## run three chains with overdispersed starting values

set.seed(1)

## starting values constructed from MLE model
mle.estimates <- rrreg(rr.q1 ~ cov.asset.index + cov.married + 
                         I(cov.age/10) + I((cov.age/10)^2) + cov.education + cov.female, 
                         data = nigeria, 
                      p = p, p1 = p1, p0 = p0,
                      design = "forced-known")

library(MASS)
draws <- mvrnorm(n = 3, mu = coef(mle.estimates), 
  Sigma = vcov(mle.estimates) * 9)

## Not run: 
##D  
##D ## run three chains
##D bayes.1 <- rrreg.bayes(rr.q1 ~ cov.asset.index + cov.married + 
##D                          I(cov.age/10) + I((cov.age/10)^2) + cov.education + cov.female,   
##D                       data = nigeria, p = p, p1 = p1, p0 = p0,
##D                       beta.tune = .0001, beta.start = draws[1,],
##D                       design = "forced-known")
##D bayes.2 <- rrreg.bayes(rr.q1 ~ cov.asset.index + cov.married + 
##D                          I(cov.age/10) + I((cov.age/10)^2) + cov.education + cov.female,   
##D                       data = nigeria, p = p, p1 = p1, p0 = p0,
##D                       beta.tune = .0001, beta.start = draws[2,],
##D                       design = "forced-known")
##D 
##D bayes.3 <- rrreg.bayes(rr.q1 ~ cov.asset.index + cov.married + 
##D                          I(cov.age/10) + I((cov.age/10)^2) + cov.education + cov.female,   
##D                       data = nigeria, p = p, p1 = p1, p0 = p0,
##D                       beta.tune = .0001, beta.start = draws[3,],
##D                       design = "forced-known")
##D                       
##D bayes <- as.list(bayes.1, bayes.2, bayes.3)
##D 
##D summary(bayes)
## End(Not run)




