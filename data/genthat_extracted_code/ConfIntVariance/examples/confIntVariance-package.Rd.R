library(ConfIntVariance)


### Name: ConfIntVariance-package
### Title: Confidence Interval for the Univariate Population Variance
###   without Normality Assumption
### Aliases: ConfIntVariance-package ConfIntVariance
### Keywords: variance, confidence interval

### ** Examples


##
## Example: throwing a dice
## 

                                        # True quantities that do not depend on n
trueMeanOfDice <- mean(1:6)


                                        # The true variance of the dice
                                        # This is the quantity that we
                                        # want to estimate by embracing
                                        # with a confidence interval
                                        # instead of just estimating
                                        # with a point estimator as is
                                        # done in the function var
trueVarianceOfDice <- mean((1:6)^2) - trueMeanOfDice^2
trueFourthCentralMomentOfDice <- mean(((1:6)-trueMeanOfDice)^4)

                                        # this requires some scribbling with paper and pencil
                                        # (or a study of Hoeffding 1948)
trueVarianceOfSampleVarianceOfDice <- function(n) 
(trueFourthCentralMomentOfDice - trueVarianceOfDice^2 * (n-3)/(n-1))/n

##
## Simulation study: compute the coverage probability of
## the confidence interval by computing the probability
## that it contains the true value.
## We want that probability to be equal to the confidence level 0.95,
## not more and not less. (If it was higher, the test would be too conservative).
##

                                        # number of times we draw a
                                        # sample and compute a confidence interval
N <- 1e4
trueValueCovered <- sapply(
    1:N,
    function(i) {
                                        # throw a dice 100 times
        x <- sample(6, 100, replace=TRUE)
                                        # compute our confidence interval
        ci <- varwci(x)
                                        # We know that the true variance
                                        # of the dice is
                                        # 35/12 = 2.916666...
                                        # Record the boolean whether the
                                        # confidence interval contains
                                        # the true value.
        (35/12 > ci[1] && 35/12 < ci[2])
    }
)

                                        # Result of simulation study:
                                        # Will be close to 0.95.
print(mean(trueValueCovered))




