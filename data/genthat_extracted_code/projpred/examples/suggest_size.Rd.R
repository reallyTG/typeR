library(projpred)


### Name: suggest_size
### Title: Suggest model size
### Aliases: suggest_size

### ** Examples

## No test: 
### Usage with stanreg objects
fit <- stan_glm(y~x, binomial())
vs <- cv_varsel(fit)
suggest_size(vs)

## End(No test)




