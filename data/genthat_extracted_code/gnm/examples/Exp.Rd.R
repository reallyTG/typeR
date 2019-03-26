library(gnm)


### Name: Exp
### Title: Specify the Exponential of a Predictor in a gnm Model Formula
### Aliases: Exp
### Keywords: models regression nonlinear

### ** Examples

set.seed(1)

## Using 'Mult' with 'Exp' to constrain the first constituent multiplier
##  to be non-negative

## Fit the "UNIDIFF" mobility model across education levels
unidiff <- gnm(Freq ~ educ*orig + educ*dest +
               Mult(Exp(educ), orig:dest),
               family = poisson, data = yaish, subset = (dest != 7))



