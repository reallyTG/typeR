library(pscl)


### Name: admit
### Title: Applications to a Political Science PhD Program
### Aliases: admit
### Keywords: datasets

### ** Examples

data(admit)
summary(admit)
## ordered probit model
op1 <- MASS::polr(score ~ gre.quant + gre.verbal + ap + pt + female,
            Hess=TRUE,
            data=admit,
            method="probit")
summary(op1)
hitmiss(op1)
logLik(op1)
pR2(op1)   



