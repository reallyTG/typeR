library(Hmisc)


### Name: na.keep
### Title: Do-nothing na.action
### Aliases: na.keep
### Keywords: models

### ** Examples

options(na.action="na.keep", na.detail.response=TRUE)
x1 <- runif(20)
x2 <- runif(20)
x2[1:4] <- NA
y <- rnorm(20)
describe(y ~ x1*x2)



