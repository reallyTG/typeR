library(projpred)


### Name: varsel-statistics
### Title: Plot or fetch summary statistics related to variable selection
### Aliases: varsel-statistics varsel_plot varsel_stats

### ** Examples

## No test: 
### Usage with stanreg objects
fit <- stan_glm(y~x, binomial())
vs <- cv_varsel(fit)
varsel_plot(vs)

# print out some stats
varsel_stats(vs, stats=c('acc'), type = c('mean','se'))
## End(No test)




