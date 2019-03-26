library(pscl)


### Name: pR2
### Title: compute various pseudo-R2 measures
### Aliases: pR2
### Keywords: models

### ** Examples

data(admit)
## ordered probit model
op1 <- MASS::polr(score ~ gre.quant + gre.verbal + ap + pt + female,
            Hess=TRUE,
            data=admit,
            method="probit")
pR2(op1)   



