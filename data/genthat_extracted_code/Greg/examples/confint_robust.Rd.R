library(Greg)


### Name: confint_robust
### Title: The confint function adapted for vcovHC
### Aliases: confint_robust

### ** Examples

n <- 50
x <- runif(n)
y <- x + rnorm(n)

fit <- lm(y~x)
library("sandwich")
confint_robust(fit, HC_type = "HC4m")



