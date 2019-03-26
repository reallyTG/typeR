library(ivmte)


### Name: propensity
### Title: Estimating propensity scores
### Aliases: propensity

### ** Examples

## Declaring a probability model.
propensity(formula = d ~ z,
               data = dtm,
               link = "linear")

## Declaring a variable to be used instead
propensity(formula = ~ pz,
               data = dtm,
               link = "linear")




