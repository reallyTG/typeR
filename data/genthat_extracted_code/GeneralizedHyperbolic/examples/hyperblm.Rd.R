library(GeneralizedHyperbolic)


### Name: hyperblm
### Title: Fitting Linear Models with Hyperbolic Errors
### Aliases: hyperblm print.hyperblm coef.hyperblm plot.hyperblm

### ** Examples

### stackloss data example
## Not run: 
##D  airflow <- stackloss[, 1]
##D  temperature <- stackloss[, 2]
##D  acid <- stackloss[, 3]
##D  stack <- stackloss[, 4]
##D 
##D  hyperblm.fit <- hyperblm(stack ~ airflow + temperature + acid)
##D 
##D  coef.hyperblm(hyperblm.fit)
##D  plot.hyperblm(hyperblm.fit, breaks = 20)
##D  summary.hyperblm(hyperblm.fit, hessian = FALSE)
## End(Not run)



