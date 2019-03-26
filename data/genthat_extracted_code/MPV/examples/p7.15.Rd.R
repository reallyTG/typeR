library(MPV)


### Name: p7.15
### Title: Data Set for Problem 7-15
### Aliases: p7.15
### Keywords: datasets

### ** Examples

data(p7.15)
y.lm <- lm(y ~ x, data=p7.15)
plot(y ~ x, data=p7.15)
abline(coef(y.lm))
plot(y.lm, which=1)



