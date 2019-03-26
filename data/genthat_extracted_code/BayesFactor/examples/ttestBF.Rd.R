library(BayesFactor)


### Name: ttestBF
### Title: Function for Bayesian analysis of one- and two-sample designs
### Aliases: ttestBF
### Keywords: htest

### ** Examples

## Sleep data from t test example
data(sleep)
plot(extra ~ group, data = sleep)

## paired t test
ttestBF(x = sleep$extra[sleep$group==1], y = sleep$extra[sleep$group==2], paired=TRUE)

## Sample from the corresponding posterior distribution
samples = ttestBF(x = sleep$extra[sleep$group==1],
           y = sleep$extra[sleep$group==2], paired=TRUE,
           posterior = TRUE, iterations = 1000)
plot(samples[,"mu"])



