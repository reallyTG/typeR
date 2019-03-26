library(PredictionR)


### Name: predI
### Title: Prediction interval for future observations
### Aliases: predI print.predI

### ** Examples

# (1) prediction interval for the next observations based on normal distribution
#
set.seed(123)
x1 <- rnorm(15, 2, 4)
predI(x1, "norm", 16, 25)


# (2) prediction interval for the next observations based on weibull distribution
#
library(actuar)
set.seed(123)
x2 <- rweibull(16 , 2 , 3)
predI(x2, "weibull", 20, 20 )




