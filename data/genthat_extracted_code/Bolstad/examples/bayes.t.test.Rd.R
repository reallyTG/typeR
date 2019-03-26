library(Bolstad)


### Name: bayes.t.test
### Title: Bayesian t-test
### Aliases: bayes.t.test bayes.t.test.default bayes.t.test.formula

### ** Examples

bayes.t.test(1:10, y = c(7:20))      # P = .3.691e-01

## Same example but with using the joint conjugate prior
## We set the prior means equal (and it doesn't matter what the value is)
## the prior precision is 0.01, which is a prior standard deviation of 10
## we're saying the true difference of the means is between [-25.7, 25.7]
## with probability equal to 0.99. The median value for the prior on sigma is 2
## and we're using a scaled inverse chi-squared prior with 1 degree of freedom
bayes.t.test(1:10, y = c(7:20), var.equal = TRUE, prior = "joint.conj", 
             m = c(0,0), n0 =  rep(0.01, 2), sig.med = 2)

##' Same example but with a large outlier. Note the assumption of equal variances isn't sensible
bayes.t.test(1:10, y = c(7:20, 200)) # P = .1979    -- NOT significant anymore

## Classical example: Student's sleep data
plot(extra ~ group, data = sleep)

## Traditional interface
with(sleep, bayes.t.test(extra[group == 1], extra[group == 2]))

## Formula interface
bayes.t.test(extra ~ group, data = sleep)



