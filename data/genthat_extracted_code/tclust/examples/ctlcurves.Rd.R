library(tclust)


### Name: ctlcurves
### Title: Classification Trimmed Likelihood Curves
### Aliases: ctlcurves print.ctlcurves
### Keywords: hplot multivariate robust cluster

### ** Examples

## Don't show: 
set.seed (0)
## End(Don't show)
## Not run: 
##D #--- EXAMPLE 1 ------------------------------------------
##D 
##D sig <- diag (2)
##D cen <- rep (1, 2)
##D x <- rbind(mvtnorm::rmvnorm(108, cen * 0,   sig),
##D 	       mvtnorm::rmvnorm(162, cen * 5,   sig * 6 - 2),
##D 	       mvtnorm::rmvnorm(30, cen * 2.5, sig * 50)
##D )
##D 
##D ctl <- ctlcurves (x, k = 1:4)
##D 
##D   ##  ctl-curves 
##D plot (ctl)  ##  --> selecting k = 2, alpha = 0.08
##D 
##D   ##  the selected model 
##D plot (tclust (x, k = 2, alpha = 0.08, restr.fact = 7))
##D 
##D #--- EXAMPLE 2 ------------------------------------------
##D 
##D data (geyser2)
##D ctl <- ctlcurves (geyser2, k = 1:5)
##D 
##D   ##  ctl-curves 
##D plot (ctl)  ##  --> selecting k = 3, alpha = 0.08
##D 
##D   ##  the selected model
##D plot (tclust (geyser2, k = 3, alpha = 0.08, restr.fact = 5))
##D 
##D 
##D #--- EXAMPLE 3 ------------------------------------------
##D 
##D data (swissbank)
##D ctl <- ctlcurves (swissbank, k = 1:5, alpha = seq (0, 0.3, by = 0.025))
##D 
##D   ##  ctl-curves 
##D plot (ctl)  ##  --> selecting k = 2, alpha = 0.1
##D 
##D   ##  the selected model
##D plot (tclust (swissbank, k = 2, alpha = 0.1, restr.fact = 50))
## End(Not run)




