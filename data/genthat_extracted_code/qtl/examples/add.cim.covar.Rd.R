library(qtl)


### Name: add.cim.covar
### Title: Indicate marker covariates from composite interval mapping
### Aliases: add.cim.covar
### Keywords: hplot

### ** Examples

## Not run: 
##D data(hyper)
##D hyper <- calc.genoprob(hyper, step=2.5)
##D 
##D out <- scanone(hyper)
##D out.cim <- cim(hyper, n.marcovar=3)
##D plot(out, out.cim, chr=c(1,4,6,15), col=c("blue", "red"))
##D 
##D add.cim.covar(out.cim, chr=c(1,4,6,15))
## End(Not run)



