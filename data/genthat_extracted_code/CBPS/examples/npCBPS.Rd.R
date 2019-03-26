library(CBPS)


### Name: npCBPS
### Title: Non-Parametric Covariate Balancing Propensity Score (npCBPS)
###   Estimation
### Aliases: npCBPS

### ** Examples


##Generate data
data(LaLonde)

## Restricted two only two covariates so that it will run quickly.
## Performance will remain good if the full LaLonde specification is used
fit <- npCBPS(treat ~ age + educ, data = LaLonde, corprior=.1/nrow(LaLonde))
plot(fit)




