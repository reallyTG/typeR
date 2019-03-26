library(miWQS)


### Name: coef.wqs
### Title: Finding WQS Coefficients
### Aliases: coef.wqs
### Keywords: wqs

### ** Examples

#Use simulated dataset and set seed for reproducibility.
data(simdata87)
set.seed(23456)
Wa <- estimate.wqs( y = simdata87$y.scenario, X = simdata87$X.true,
                  B = 10, family = "binomial")
coef(Wa)



