library(dplRCon)


### Name: Example 2
### Title: Example 2: Calculate the cordance
### Aliases: 'Example 2'

### ** Examples


#library('dplRCon')
#loading data
data(ring.raw)
data(ring.stand)
data(dbh.po.nc)

#Subset "near-pith" is the material within 0 -20cm from the estimated pith
spline200.sub0.20.n   <- TruncSeriesPithoffset( ring.raw, ring.stand, dbh.po.nc, c(1,200))
# Subset "far-pith" is the material further than 20cm from the estimated pith
spline200.sub20.2000.n  <- TruncSeriesPithoffset( ring.raw, ring.stand, dbh.po.nc, c(200,200000))
# Whole dataset, through truncated functions to get in the same formate as the above two datasets
spline200.sub0.2000.n  <- TruncSeriesPithoffset( ring.raw, ring.stand, dbh.po.nc, c(00,200000))

## Not run: 
##D #series.bootstapped
##D boot.0.20   <-  series.bootstrap( spline200.sub0.20.n$sub.series.stand, stat, 999, 
##D names.stat, aver.by.tree = FALSE)
##D boot.20.2000   <- series.bootstrap(spline200.sub20.2000.n$sub.series.stand, stat, 999, 
##D names.stat, aver.by.tree = FALSE)
##D 
##D boot.0.20 <- boot.0.20$boot.series.mean
##D boot.20.2000 <- boot.20.2000$boot.series.mean
## End(Not run)

data(boot.0.20)
data(boot.20.2000)

overall.precision.HUP <- overall.concordance.period(spline200.sub20.2000.n$sub.series.stand , 
spline200.sub0.20.n$sub.series.stand, boot.20.2000,  
boot.0.20 ,1 , concordance.indices, 
c(1880,1999), trim.alpha=0.005, concordance.beta=0.5)


figure.function.concordance (overall.precision.HUP, x.lim=c(1880,2000))



