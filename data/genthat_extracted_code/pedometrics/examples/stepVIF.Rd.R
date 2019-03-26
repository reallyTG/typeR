library(pedometrics)


### Name: stepVIF
### Title: Variable selection using the variance-inflation factor
### Aliases: stepVIF
### Keywords: methods regression

### ** Examples

require(car)
fit <- lm(prestige ~ income + education + type, data = Duncan)
fit <- stepVIF(fit, threshold = 10, verbose = TRUE)




