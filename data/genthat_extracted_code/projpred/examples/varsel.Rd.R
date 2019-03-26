library(projpred)


### Name: varsel
### Title: Variable selection for generalized linear models
### Aliases: varsel

### ** Examples

## No test: 
### Usage with stanreg objects
fit <- stan_glm(y~x, binomial())
vs <- varsel(fit)
varsel_plot(vs)
## End(No test)




