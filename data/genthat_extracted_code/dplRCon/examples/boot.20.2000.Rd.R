library(dplRCon)


### Name: boot.20.2000
### Title: Bootstrapped matrix of time series for old material.
### Aliases: boot.20.2000
### Keywords: datasets

### ** Examples

data(boot.20.2000)
## maybe str(boot.20.2000) ; plot(boot.20.2000) ...

## Not run: 
##D # This dataset was produced by running the following. 
##D data(ring.raw)
##D data(ring.stand)
##D data(dbh.po.nc)
##D 
##D # Subset "far-pith" is the material further than 20cm from the estimated pith
##D spline200.sub20.2000.n  <- TruncSeriesPithoffset( ring.raw, ring.stand, dbh.po.nc, c(200,200000))
##D 
##D boot.20.2000   <- series.bootstrap(spline200.sub20.2000.n$sub.series.stand, stat, 999, 
##D names.stat, aver.by.tree = FALSE)
##D 
##D boot.20.2000 <- boot.20.2000$boot.series.mean
## End(Not run)



