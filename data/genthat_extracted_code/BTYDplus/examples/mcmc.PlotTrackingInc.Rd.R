library(BTYDplus)


### Name: mcmc.PlotTrackingInc
### Title: Tracking Incremental Transactions Plot for Pareto/GGG,
###   Pareto/NBD (HB) and Pareto/NBD (Abe)
### Aliases: mcmc.PlotTrackingInc

### ** Examples

## Not run: 
##D data("groceryElog")
##D cbs <- elog2cbs(groceryElog, T.cal = "2006-12-31")
##D inc <- elog2inc(groceryElog)
##D param.draws <- pnbd.mcmc.DrawParameters(cbs)
##D mat <- mcmc.PlotTrackingInc(param.draws,
##D   T.cal = cbs$T.cal,
##D   T.tot = max(cbs$T.cal + cbs$T.star),
##D   actual.inc.tracking.data = inc)
## End(Not run)



