library(drc)


### Name: deguelin
### Title: Deguelin applied to chrysanthemum aphis
### Aliases: deguelin
### Keywords: datasets

### ** Examples


## Log-logistic fit
deguelin.m1 <- drm(r/n~dose, weights=n, data=deguelin, fct=LL.2(), type="binomial")
modelFit(deguelin.m1)
summary(deguelin.m1)

## Loess fit
deguelin.m2 <- loess(r/n~dose, data=deguelin, degree=1)

## Plot of data with fits superimposed
plot(deguelin.m1, ylim=c(0.2,1))
lines(1:60, predict(deguelin.m2, newdata=data.frame(dose=1:60)), col = 2, lty = 2)

lines(1:60, 0.95*predict(deguelin.m2, 
newdata=data.frame(dose=1:60))+0.05*predict(deguelin.m1, newdata=data.frame(dose=1:60), se = FALSE),
col = 3, lty=3)




