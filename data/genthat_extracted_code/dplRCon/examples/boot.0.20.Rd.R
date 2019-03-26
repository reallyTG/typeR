library(dplRCon)


### Name: boot.0.20
### Title: Bootstrapped matrix of time series for young material.
### Aliases: boot.0.20
### Keywords: datasets

### ** Examples

data(boot.0.20)
## maybe str(boot.0.20) ; plot(boot.0.20) ...
## Not run: 
##D # This dataset was produced by running the following. 
##D data(ring.raw)
##D data(ring.stand)
##D data(dbh.po.nc)
##D 
##D #Subset "near-pith" is the material within 0 -20cm from the estimated pith
##D spline200.sub0.20.n   <- TruncSeriesPithoffset( ring.raw, ring.stand, dbh.po.nc, c(1,200))
##D 
##D boot.0.20   <-  series.bootstrap( spline200.sub0.20.n$sub.series.stand, stat, 999, 
##D names.stat, aver.by.tree = FALSE)
##D 
##D boot.0.20 <- boot.0.20$boot.series.mean
## End(Not run)



