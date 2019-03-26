library(MPV)


### Name: p7.4
### Title: Data Set for Problem 7-4
### Aliases: p7.4
### Keywords: datasets

### ** Examples

data(p7.4)
y.lm <- lm(y ~ x + I(x^2), data = p7.4)
summary(y.lm)



