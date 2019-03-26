library(MPV)


### Name: p4.18
### Title: Data Set for Problem 4-18
### Aliases: p4.18
### Keywords: datasets

### ** Examples

data(p4.18)
y.lm <- lm(y ~ x1 + x2 + x3, data=p4.18)
summary(y.lm)
y.lm <- lm(y ~ x1, data=p4.18)



