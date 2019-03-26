library(PredictionR)


### Name: predP
### Title: Prediction point for future observations
### Aliases: predP print.predP

### ** Examples

# prediction point for the next observations based on gamma distribution
#
set.seed(123)
x1 <- rgamma(10, 4, 2)
predP(x1, "gamma", 8, 20)




