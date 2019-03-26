library(evmix)


### Name: evmix.diag
### Title: Diagnostic Plots for Extreme Value Mixture Models
### Aliases: evmix.diag rlplot qplot pplot densplot rlplot evmix.diag qplot
###   pplot densplot qplot evmix.diag rlplot pplot densplot pplot
###   evmix.diag rlplot qplot densplot densplot evmix.diag rlplot qplot
###   pplot

### ** Examples

## Not run: 
##D set.seed(1)
##D 
##D x = sort(rnorm(1000))
##D fit = fnormgpd(x)
##D evmix.diag(fit)
##D 
##D # repeat without focussing on upper tail
##D par(mfrow=c(2,2))
##D rlplot(fit, upperfocus = FALSE)
##D qplot(fit, upperfocus = FALSE)
##D pplot(fit, upperfocus = FALSE)
##D densplot(fit, upperfocus = FALSE)
## End(Not run)




