library(givitiR)


### Name: polynomialLogRegrFw
### Title: Forward Selection in Polynomial Logistic Regression
### Aliases: polynomialLogRegrFw

### ** Examples

e <- runif(100)
logite <- logit(e)
o <- rbinom(100, size = 1, prob = e)
data <- data.frame(e = e, o = o, logite = logite)
polynomialLogRegrFw(data, .95, 4, 1)



