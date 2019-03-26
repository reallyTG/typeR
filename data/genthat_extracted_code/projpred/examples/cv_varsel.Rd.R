library(projpred)


### Name: cv_varsel
### Title: Cross-validate the variable selection (varsel)
### Aliases: cv_varsel

### ** Examples

## No test: 
### Usage with stanreg objects
fit <- stan_glm(y~x, binomial())
cvs <- cv_varsel(fit)
varsel_plot(cvs)
## End(No test)




