library(fsdaR)


### Name: MMreg_control
### Title: Creates an 'MMreg_control' object
### Aliases: MMreg_control
### Keywords: robust regression

### ** Examples


## (out <- fsreg(Y~., data=hbk, method="MM", control=MMreg_control(eff=0.99, rhofunc="optimal")))
(out <- fsreg(Y~., data=hbk, method="MM", control=MMreg_control(eff=0.99)))




