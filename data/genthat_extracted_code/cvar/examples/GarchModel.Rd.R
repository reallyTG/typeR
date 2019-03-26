library(cvar)


### Name: GarchModel
### Title: Specify a GARCH model
### Aliases: GarchModel

### ** Examples

## GARCH(1,1) with Gaussian innovations
mo1a <- GarchModel(omega = 1, alpha = 0.3, beta = 0.5)
mo1b <- GarchModel(omega = 1, alpha = 0.3, beta = 0.5, cond.dist = "norm")

## set also initial values
mo2 <- GarchModel(omega = 1, alpha = 0.3, beta = 0.5, esp0 = - 1.5, h0 = 4.96)

##  GARCH(1,1) with standardised-t_5
mot <- GarchModel(omega = 1, alpha = 0.3, beta = 0.5, cond.dist = list("std", nu = 5))




