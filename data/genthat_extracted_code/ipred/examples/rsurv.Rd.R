library(ipred)


### Name: rsurv
### Title: Simulate Survival Data
### Aliases: rsurv
### Keywords: survival

### ** Examples


library("survival")
# 3*X1 + X2
simdat <- rsurv(500, model="C")
coxph(Surv(time, cens) ~ ., data=simdat)




