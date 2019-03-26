library(prevalence)


### Name: propCI
### Title: Calculate confidence intervals for prevalences and other
###   proportions
### Aliases: propCI
### Keywords: prevalence confidence interval

### ** Examples

## All methods, 95% confidence intervals
propCI(x = 142, n = 742)

## Wald-type 90%, 95% and 99% confidence intervals
propCI(x = 142, n = 742, method = "wald", level = c(0.90, 0.95, 0.99))



