library(qpcR)


### Name: expfit
### Title: Calculation of PCR efficiency by fitting an exponential model
### Aliases: expfit
### Keywords: models nonlinear

### ** Examples

## Using default SDM method.
m1 <- pcrfit(reps, 1, 2, l5)
expfit(m1)

## Using 'outlier' method.
expfit(m1, method = "outlier")

## Linear exponential model.
expfit(m1, model = "linexp")



