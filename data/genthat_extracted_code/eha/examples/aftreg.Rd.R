library(eha)


### Name: aftreg
### Title: Accelerated Failure Time Regression
### Aliases: aftreg
### Keywords: regression survival

### ** Examples


data(mort)
aftreg(Surv(enter, exit, event) ~ ses, param = "lifeExp", data = mort)




