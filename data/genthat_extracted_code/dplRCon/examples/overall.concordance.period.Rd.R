library(dplRCon)


### Name: overall.concordance.period
### Title: Overall Concordance period
### Aliases: overall.concordance.period

### ** Examples

#loading data
## Not run: 
##D data(ring.raw)
##D data(ring.stand)
##D data(dbh.po.nc)
##D 
##D #Subset near-pith is the material within 0 -20cm from the estimated pith
##D spline200.sub0.20.n   <- TruncSeriesPithoffset( ring.raw, ring.stand, dbh.po.nc, c(1,200))
##D # Subset far-pith is the material further than 20cm from the estimated pith
##D spline200.sub20.2000.n  <- TruncSeriesPithoffset( ring.raw, ring.stand, dbh.po.nc, c(200,200000))
##D 
##D # series.bootstapped
##D boot.0.20   <-  series.bootstrap( spline200.sub0.20.n$sub.series.stand,
##D    stat, 999, names.stat, aver.by.tree = FALSE)
##D boot.20.2000   <- series.bootstrap(spline200.sub20.2000.n$sub.series.stand,
##D    stat, 999, names.stat, aver.by.tree = FALSE)
##D 
##D overall.precision.HUP <- overall.concordance.period(spline200.sub20.2000.n$sub.series.stand ,
##D    spline200.sub0.20.n$sub.series.stand,
##D    boot.20.2000$boot.series.mean,  boot.0.20$boot.series.mean ,
##D    1 , concordance.indices, c(1880,1999), trim.alpha=0.005, concordance.beta=0.5)
## End(Not run)



