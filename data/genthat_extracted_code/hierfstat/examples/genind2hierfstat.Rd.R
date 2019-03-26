library(hierfstat)


### Name: genind2hierfstat
### Title: Converts genind objects from adegenet into a hierfstat data
###   frame
### Aliases: genind2hierfstat

### ** Examples

## Not run: 
##D library(adegenet)
##D data(nancycats)
##D genind2hierfstat(nancycats)
##D basic.stats(nancycats)
##D genet.dist(nancycats)
##D data(H3N2)
##D basic.stats(genind2hierfstat(H3N2,pop=rep(1,dim(H3N2@tab)[1])),diploid=FALSE)
## End(Not run)



