library(mice)


### Name: pool.r.squared
### Title: Pooling: R squared
### Aliases: pool.r.squared
### Keywords: htest

### ** Examples



imp<-mice(nhanes)

fit<-lm.mids(chl~age+hyp+bmi,imp)
pool.r.squared(fit)
pool.r.squared(fit,adjusted=TRUE)

#fit<-lm.mids(chl~age+hyp+bmi,imp)
#
#> pool.r.squared(fit)
#          est     lo 95     hi 95       fmi
#R^2 0.5108041 0.1479687 0.7791927 0.3024413
#
#> pool.r.squared(fit,adjusted=TRUE)
#          est      lo 95    hi 95       fmi
#adj R^2 0.4398066 0.08251427 0.743172 0.3404165
#





