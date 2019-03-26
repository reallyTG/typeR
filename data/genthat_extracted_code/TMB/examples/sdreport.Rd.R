library(TMB)


### Name: sdreport
### Title: General sdreport function.
### Aliases: sdreport

### ** Examples

## Not run: 
##D runExample("linreg_parallel", thisR = TRUE) ## Non-random effect example
##D sdreport(obj) 
## End(Not run)

runExample("simple", thisR = TRUE)          ## Random effect example
rep <- sdreport(obj)
summary(rep, "random")                      ## Only random effects
summary(rep, "fixed", p.value = TRUE)       ## Only non-random effects
summary(rep, "report")                      ## Only report

## Bias correction
rep <- sdreport(obj, bias.correct = TRUE)
summary(rep, "report")                      ## Include bias correction



