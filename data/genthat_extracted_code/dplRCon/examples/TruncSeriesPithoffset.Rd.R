library(dplRCon)


### Name: TruncSeriesPithoffset
### Title: Truncate series by range pithoffsets
### Aliases: TruncSeriesPithoffset

### ** Examples

## Not run: 
##D data(ring.raw)
##D data(ring.stand)
##D data(dbh.po.nc)
##D #Subset near-pith is the material within 0 -20cm from the estimated pith
##D spline200.sub0.20.n   <- TruncSeriesPithoffset( ring.raw, ring.stand, dbh.po.nc, c(1,200))
##D # Subset far-pith is the material further than 20cm from the estimated pith
##D spline200.sub20.2000.n  <- TruncSeriesPithoffset( ring.raw, ring.stand, dbh.po.nc, c(200,200000))
##D # Whole dataset, through truncated functions to get in the same formate as the above two datasets
##D spline200.sub0.2000.n  <- TruncSeriesPithoffset( ring.raw, ring.stand, dbh.po.nc, c(00,200000))
## End(Not run)



