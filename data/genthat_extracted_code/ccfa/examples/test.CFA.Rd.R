library(ccfa)


### Name: test.CFA
### Title: test.CFA
### Aliases: test.CFA

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
##D test.CFA(out$cfa1, Var, igm$lfincome)
## End(Not run)



