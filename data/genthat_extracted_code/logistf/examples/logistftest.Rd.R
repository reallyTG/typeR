library(logistf)


### Name: logistftest
### Title: Penalized Likelihood Ratio Test
### Aliases: logistftest
### Keywords: regression models

### ** Examples

data(sex2)
fit<-logistf(case ~ age+oc+vic+vicl+vis+dia,  data=sex2)

logistftest(fit, test = ~ vic + vicl - 1, values = c(2, 0))
                        



