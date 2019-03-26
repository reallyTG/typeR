library(ltm)


### Name: summary
### Title: Summary method for fitted IRT models
### Aliases: summary.gpcm summary.grm summary.ltm summary.rasch summary.tpm
### Keywords: methods

### ** Examples


# use Hessian = TRUE if you want standard errors
fit <- grm(Science[c(1,3,4,7)], Hessian = TRUE)
summary(fit)

## One factor model using the WIRS data;
## results are reported under the IRT
## parameterization
fit <- ltm(WIRS ~ z1)
summary(fit)




