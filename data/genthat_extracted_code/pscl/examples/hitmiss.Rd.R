library(pscl)


### Name: hitmiss
### Title: Table of Actual Outcomes against Predicted Outcomes for discrete
###   data models
### Aliases: hitmiss hitmiss.glm
### Keywords: models

### ** Examples

data(admit)
## ordered probit model
op1 <- MASS::polr(score ~ gre.quant + gre.verbal + ap + pt + female,
            Hess=TRUE,
            data=admit,
            method="probit")
hitmiss(op1)



