library(ConfIntVariance)


### Name: varwci
### Title: varwci
### Aliases: varwci
### Keywords: variance estimation confidence interval

### ** Examples

##
## Example: throwing a dice
## 

# throw a dice 100 times
s <- sample(6, 100, replace=TRUE)

# the standard point estimator for the variance
print(var(s))

# contains the true value 2.9166 with a probability of 95 percent.
print(varwci(s))

##
## Check the coverage probability of the confidence interval
##

                                        # True quantities that do not depend on n
trueMeanOfDice <- mean(1:6)
trueVarianceOfDice <- mean((1:6)^2) - trueMeanOfDice^2

## see package description for more details
                                        # number of times we draw a
                                        # sample and compute a confidence interval
N <- 1e4
trueValueCovered <- rep(NA, N)
for (i in 1:N) {
    if (i %% 1e3 == 0) print(i)
                                        # throw a dice 100 times
    x <- sample(6, 100, replace=TRUE)
                                        # compute our confidence interval
    ci <- varwci(x)
                                        # We know that the true variance
                                        # of the dice is 91/6 - 49/4 = 2.916666...
                                        # did the confidence interval contain the correct value?
    trueValueCovered[i] <- (trueVarianceOfDice > ci[1] && trueVarianceOfDice < ci[2])
}

                                        # Result of simulation study: should be close to 0.95
print(mean(trueValueCovered))



