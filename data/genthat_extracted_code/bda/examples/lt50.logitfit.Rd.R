library(bda)


### Name: ld50.logitfit
### Title: Predict Doses for Binomial Assay model (using counts)
### Aliases: ld50.logitfit
### Keywords: regression models

### ** Examples

ldose <- rep(0:5, 2)
rate <- c(1, 4, 9, 13, 18, 20, 0, 2, 6, 10, 12, 16)/20

ld50.logitfit(rate,ldose,p = 0.5)



