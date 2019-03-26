library(onls)


### Name: confint.onls
### Title: Confidence intervals for 'onls' model parameters
### Aliases: confint.onls
### Keywords: models nonlinear

### ** Examples

## Not run: 
##D DNase1 <- subset(DNase, Run == 1)
##D DNase1$density <- sapply(DNase1$density, function(x) rnorm(1, x, 0.1 * x))
##D mod1 <- onls(density ~ Asym/(1 + exp((xmid - log(conc))/scal)), 
##D              data = DNase1, start = list(Asym = 3, xmid = 0, scal = 1))
##D confint(mod1)
## End(Not run)



