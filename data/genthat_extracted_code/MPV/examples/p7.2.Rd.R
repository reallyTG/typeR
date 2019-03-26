library(MPV)


### Name: p7.2
### Title: Data Set for Problem 7-2
### Aliases: p7.2
### Keywords: datasets

### ** Examples

data(p7.2)
y.lm <- lm(y ~ x + I(x^2), data=p7.2)
summary(y.lm)
plot(y ~ x, data=p7.2)



