library(BTYDplus)


### Name: mbgcnbd.PlotTrackingCum
### Title: (M)BG/CNBD-k Tracking Cumulative Transactions Plot
### Aliases: bgcnbd.PlotTrackingCum mbgcnbd.PlotTrackingCum

### ** Examples

## Not run: 
##D data("groceryElog")
##D groceryElog <- groceryElog[groceryElog$date < "2006-06-30", ]
##D cbs <- elog2cbs(groceryElog, T.cal = "2006-04-30")
##D cum <- elog2cum(groceryElog)
##D params <- mbgcnbd.EstimateParameters(cbs, k = 2)
##D mbgcnbd.PlotTrackingCum(params, cbs$T.cal,
##D   T.tot = max(cbs$T.cal + cbs$T.star), cum)
## End(Not run)



