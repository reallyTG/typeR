library(MPV)


### Name: p7.19
### Title: Data Set for Problem 7-19
### Aliases: p7.19
### Keywords: datasets

### ** Examples

data(p7.19)
y.lm <- lm(y ~ x + I(x^2), data=p7.19)
summary(y.lm)



