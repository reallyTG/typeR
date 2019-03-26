library(ccfa)


### Name: ggplot2.CFA
### Title: ggplot2.CFA
### Aliases: ggplot2.CFA

### ** Examples

## Not run: 
##D data(igm)
##D tvals <- seq(10,12,length.out=8)
##D yvals <- seq(quantile(igm$lcfincome, .05), quantile(igm$lcfincome, .95), length.out=50)
##D 
##D ## obtain counterfactual results
##D out <- cfa2(lcfincome ~ lfincome, tvals, yvals, igm, method1="qr",
##D xformla2=~HEDUC, method2="qr", iters=10, tau1=seq(.05,.95,.05),
##D tau2=seq(.05,.95,.05))
##D 
##D ## get the difference between the average that adjusts for covariates and
##D ## the one that does not
##D ggplot2.CFA(getResDiff.CFA(out$cfa1, out$cfa2, E), setype="uniform")
## End(Not run) 




