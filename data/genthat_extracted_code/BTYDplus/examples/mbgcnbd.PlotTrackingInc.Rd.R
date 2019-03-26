library(BTYDplus)


### Name: mbgcnbd.PlotTrackingInc
### Title: (M)BG/CNBD-k Tracking Incremental Transactions Comparison
### Aliases: bgcnbd.PlotTrackingInc mbgcnbd.PlotTrackingInc

### ** Examples

## Not run: 
##D data("groceryElog")
##D groceryElog <- groceryElog[groceryElog$date < "2006-06-30", ]
##D cbs <- elog2cbs(groceryElog, T.cal = "2006-04-30")
##D inc <- elog2inc(groceryElog)
##D params <- mbgcnbd.EstimateParameters(cbs, k = 2)
##D mbgcnbd.PlotTrackingInc(params, cbs$T.cal,
##D   T.tot = max(cbs$T.cal + cbs$T.star), inc)
## End(Not run)



