library(ccfa)


### Name: lige
### Title: lige
### Aliases: lige

### ** Examples

## Not run: 
##D data(igm)
##D tvals <- seq(10,12,length.out=8)
##D yvals <- seq(quantile(igm$lcfincome, .05), quantile(igm$lcfincome, .95), length.out=50)
##D ## obtain counterfactual results
##D out <- cfa2(lcfincome ~ lfincome, tvals, yvals, igm, method1="qr",
##D xformla2=~HEDUC, method2="qr", iters=10, tau1=seq(.05,.95,.05),
##D tau2=seq(.05,.95,.05))
##D lige(out$cfa1, h=0.5)
## End(Not run)




