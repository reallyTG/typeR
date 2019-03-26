library(BTYDplus)


### Name: mcmc.PlotTrackingCum
### Title: Tracking Cumulative Transactions Plot for Pareto/GGG, Pareto/NBD
###   (HB) and Pareto/NBD (Abe)
### Aliases: mcmc.PlotTrackingCum

### ** Examples

## Not run: 
##D data("groceryElog")
##D cbs <- elog2cbs(groceryElog, T.cal = "2006-12-31")
##D cum <- elog2cum(groceryElog)
##D param.draws <- pnbd.mcmc.DrawParameters(cbs)
##D mat <- mcmc.PlotTrackingCum(param.draws,
##D   T.cal = cbs$T.cal,
##D   T.tot = max(cbs$T.cal + cbs$T.star),
##D   actual.cu.tracking.data = cum)
## End(Not run)



