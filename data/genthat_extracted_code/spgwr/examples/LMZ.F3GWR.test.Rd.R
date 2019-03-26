library(spgwr)


### Name: LMZ.F3GWR.test
### Title: Global tests of geographical weighted regressions
### Aliases: LMZ.F3GWR.test LMZ.F2GWR.test LMZ.F1GWR.test BFC99.gwr.test
###   BFC02.gwr.test anova.gwr
### Keywords: spatial

### ** Examples

data(columbus, package="spData")
col.bw <- gwr.sel(CRIME ~ INC + HOVAL, data=columbus,
  coords=cbind(columbus$X, columbus$Y))
col.gauss <- gwr(CRIME ~ INC + HOVAL, data=columbus,
  coords=cbind(columbus$X, columbus$Y), bandwidth=col.bw, hatmatrix=TRUE)
BFC99.gwr.test(col.gauss)
BFC02.gwr.test(col.gauss)
BFC02.gwr.test(col.gauss, approx=TRUE)
anova(col.gauss)
anova(col.gauss, approx=TRUE)
## Not run: 
##D col.d <- gwr.sel(CRIME ~ INC + HOVAL, data=columbus,
##D   coords=cbind(columbus$X, columbus$Y), gweight=gwr.bisquare)
##D col.bisq <- gwr(CRIME ~ INC + HOVAL, data=columbus,
##D   coords=cbind(columbus$X, columbus$Y), bandwidth=col.d, 
##D   gweight=gwr.bisquare, hatmatrix=TRUE)
##D BFC99.gwr.test(col.bisq)
## End(Not run)



