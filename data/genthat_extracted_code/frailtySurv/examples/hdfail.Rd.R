library(frailtySurv)


### Name: hdfail
### Title: Hard drive failure dataset
### Aliases: hdfail
### Keywords: datasets

### ** Examples

## Not run: 
##D data(hdfail)
##D 
##D # Select only Western Digital hard drives
##D dat <- subset(hdfail, grepl("WDC", model))
##D 
##D fit.hd <- fitfrail(Surv(time, status) ~ temp + rer + rsc 
##D                                       + psc + cluster(model), 
##D                    dat, frailty="gamma", fitmethod="score")
##D 
##D fit.hd
## End(Not run)



