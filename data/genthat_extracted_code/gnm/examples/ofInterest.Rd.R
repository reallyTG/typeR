library(gnm)


### Name: ofInterest
### Title: Coefficients of Interest in a Generalized Nonlinear Model
### Aliases: ofInterest ofInterest<-
### Keywords: models

### ** Examples

set.seed(1)

## Fit the "UNIDIFF" mobility model across education levels
unidiff <- gnm(Freq ~ educ*orig + educ*dest +
               Mult(Exp(educ), orig:dest),
               ofInterest = "[.]educ", family = poisson,
               data = yaish,  subset = (dest != 7))
ofInterest(unidiff)

## Get all of the contrasts with educ1 in the UNIDIFF multipliers
getContrasts(unidiff, ofInterest(unidiff))

## Get estimate and se for the contrast between educ4 and educ5 in the
## UNIDIFF multiplier
mycontrast <- numeric(length(coef(unidiff)))
mycontrast[ofInterest(unidiff)[4:5]] <- c(1, -1)
se(unidiff, mycontrast)



