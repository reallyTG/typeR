library(MPV)


### Name: p7.6
### Title: Data Set for Problem 7-6
### Aliases: p7.6
### Keywords: datasets

### ** Examples

data(p7.6)
y.lm <- lm(y ~ x1 + I(x1^2) + x2 + I(x2^2) + I(x1*x2), data=p7.6)
summary(y.lm)



