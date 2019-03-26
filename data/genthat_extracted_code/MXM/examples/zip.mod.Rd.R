library(MXM)


### Name: Zero inflated Poisson regression
### Title: Zero inflated Poisson regression
### Aliases: zip.mod zip.reg
### Keywords: Regression model zero inflated Poisson

### ** Examples

y <- rpois(100, 2)
x <- matrix( rnorm(100 * 2), ncol = 2)
a1 <- glm(y ~ x, poisson)
a2 <- zip.mod(y, x) 
summary(a1)
logLik(a1)
a2  ## a ZIP is not really necessary
y[1:20] <- 0
a1 <- glm(y ~ x, poisson)
a2 <- zip.mod(y, x) 
summary(a1)
logLik(a1)
a2  ## a ZIP is probably more necessary



