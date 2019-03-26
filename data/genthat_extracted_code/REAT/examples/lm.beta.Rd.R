library(REAT)


### Name: lm.beta
### Title: Beta regression coefficients
### Aliases: lm.beta

### ** Examples

x1 <- runif(100)
x2 <- runif(100)
# random values for two independent variables (x1, x2)
y <- runif(100)
# random values for the dependent variable (y)
testmodel <- lm(y~x1+x2)
# OLS regression
summary(testmodel)
# summary
lm.beta(testmodel)
# beta coefficients



