library(STB)


### Name: SASquantile
### Title: Implements SAS-quantile Calculation (PCTLDEF=5) as Described by
###   SAS-Help.
### Aliases: SASquantile

### ** Examples

## Not run: 
##D SASquantile(1:100, .75)
##D 
##D ### compare to R-default
##D quantile(1:100, .75) 
##D 
##D ### or to what R calls SAS-definition
##D quantile(1:100, .75, type=3)
##D 
##D # should work for any vector (no seed)
##D v <- rnorm(50000,20,7)
##D Q.R2    <- quantile(v, probs=c(.01, .025, .05, .1, .25, .5, .75, .9, .95, .975, .99), type=2)
##D Q.SAS.R <- SASquantile(v, prob=c(.01, .025, .05, .1, .25, .5, .75, .9, .95, .975, .99), type="R")
##D Q.SAS.C <- SASquantile(v, prob=c(.01, .025, .05, .1, .25, .5, .75, .9, .95, .975, .99), type="C")
##D 
##D Q.R2
##D Q.SAS.R
##D Q.SAS.C
## End(Not run)



