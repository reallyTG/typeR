library(PCovR)


### Name: PCovR-package
### Title: Principal Covariates Regression
### Aliases: PCovR-package PCovR
### Keywords: package

### ** Examples

data(alexithymia)
results <- pcovr(alexithymia$X, alexithymia$Y)
summary(results)
plot(results)



