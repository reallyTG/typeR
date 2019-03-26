library(Renext)


### Name: Renext-package
### Title: Renewal Method for Extreme Values Extrapolation
### Aliases: Renext-package Renext
### Keywords: datagen

### ** Examples

## 'Garonne' data set
summary(Garonne)
plot(Garonne)

## Weibull excesses
fG <- Renouv(x = Garonne,
             threshold = 3000,
             distname.y = "weibull",
             main = "Weibull fit for 'Garonne'")

coef(fG)
vcov(fG)
summary(fG)
logLik(fG)
## Re-plot if needed
plot(fG)

## Classical 'predict' method with usual formal args 
predict(fG, newdata = c(100, 150, 200), level = c(0.8, 0.9))



