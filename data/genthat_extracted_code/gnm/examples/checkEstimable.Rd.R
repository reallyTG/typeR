library(gnm)


### Name: checkEstimable
### Title: Check Whether One or More Parameter Combinations in a gnm Model
###   are Identified
### Aliases: checkEstimable
### Keywords: models regression nonlinear

### ** Examples

set.seed(1)

## Fit the "UNIDIFF" mobility model across education levels
unidiff <- gnm(Freq ~ educ*orig + educ*dest +
               Mult(Exp(educ), orig:dest), family = poisson,
               data = yaish, subset = (dest != 7))

## Check whether multiplier contrast educ4 - educ5 is estimable
ofInterest(unidiff) <- pickCoef(unidiff, "[.]educ")
mycontrast <- numeric(length(coef(unidiff)))
mycontrast[ofInterest(unidiff)[4:5]] <- c(1, -1)
checkEstimable(unidiff, mycontrast)
## should be TRUE

## Check whether multiplier educ4 itself is estimable
mycontrast[ofInterest(unidiff)[5]] <- 0
checkEstimable(unidiff, mycontrast)
## should be FALSE -- only *differences* are identified here



