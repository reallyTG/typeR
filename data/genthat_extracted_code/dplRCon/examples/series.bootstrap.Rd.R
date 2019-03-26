library(dplRCon)


### Name: series.bootstrap
### Title: Series bootstrap
### Aliases: series.bootstrap

### ** Examples

## Not run: 
##D #Subset "near-pith" is the material within 0 -20cm from the estimated pith
##D spline200.sub0.20.n   <- TruncSeriesPithoffset( ring.raw, ring.stand, dbh.po.nc, c(1,200))
##D boot.0.20   <-  series.bootstrap( spline200.sub0.20.n$sub.series.stand, stat, 999,
##D    names.stat, aver.by.tree = FALSE)
## End(Not run)



