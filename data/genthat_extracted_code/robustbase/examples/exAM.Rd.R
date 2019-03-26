library(robustbase)


### Name: exAM
### Title: Example Data of Antille and May - for Simple Regression
### Aliases: exAM
### Keywords: robust datasets

### ** Examples

data(exAM)
plot(exAM)
summary(ls <- lm(y ~ x, data=exAM))
abline(ls)



