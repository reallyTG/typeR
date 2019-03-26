library(MPV)


### Name: p4.19
### Title: Data Set for Problem 4-19
### Aliases: p4.19
### Keywords: datasets

### ** Examples

data(p4.19)
attach(p4.19)
y.lm <- lm(y ~ x1 + x2 + x3)
summary(y.lm)
plot(y.lm, which=1)
y.lm <- lm(y ~ x1)
detach(p4.19)



