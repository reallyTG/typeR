library(bsam)


### Name: map_ssm
### Title: Plot estimated track, behavioural states and observations on a
###   map.
### Aliases: map_ssm

### ** Examples

## Not run: 
##D data(ellie)
##D fit.s <- fitSSM(ellie, model = "DCRWS", tstep = 1, adapt = 2000, samples = 1000, 
##D               thin = 2, span = 0.1)
##D map_ssm(fit.s, onemap = TRUE)
##D 
##D hfit.s <- fit_ssm(ellie, model = "hDCRWS", tstep = 1, adapt = 2000, samples = 1000, 
##D                 thin = 2, span = 0.1)
##D map_ssm(hfit.s)
## End(Not run)



