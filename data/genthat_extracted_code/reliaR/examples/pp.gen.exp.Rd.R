library(reliaR)


### Name: pp.gen.exp
### Title: Probability versus Probability (PP) plot for the Generalized
###   Exponential(GE) distribution
### Aliases: pp.gen.exp
### Keywords: hplot

### ** Examples

## Load dataset
data(bearings)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 5.28321139, lambda.est = 0.03229609

pp.gen.exp(bearings, 5.28321139, 0.03229609, line = TRUE)



