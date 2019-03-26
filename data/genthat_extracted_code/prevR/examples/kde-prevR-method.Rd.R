library(prevR)


### Name: kde,prevR-method
### Title: Kernel density estimation for prevR object.
### Aliases: kde kde,prevR-method kde-methods
### Keywords: smooth spatial

### ** Examples

## Not run: 
##D   dhs <- rings(fdhs, N=c(100,200,300,400,500))
##D   
##D   prev.N300 <- kde(dhs, N=300, nb.cells=200)
##D   spplot(prev.N300, 'k.wprev.N300.RInf',
##D          cuts=100, col.regions=prevR.colors.red(101),
##D          main="Regional trends of prevalence (N=300)"
##D   )
##D   
##D   prev.krige <- kde(dhs, N=c(100,300,500), R=Inf,
##D                     nb.cells=200, risk.ratio=2, keep.details=FALSE
##D   )
##D   str(prev.krige)
##D   dev.new()
##D   spplot(prev.krige,
##D          c('k.wprev.N100.RInf','k.wprev.N300.RInf','k.wprev.N500.RInf'),
##D          cuts=100, col.regions=prevR.colors.red(101)
##D   )
## End(Not run)




