library(ecospat)


### Name: ecospat.sample.envar
### Title: Sample Environmental Variables
### Aliases: ecospat.sample.envar

### ** Examples

## Not run: 
##D data("ecospat.testNiche")
##D spp <- ecospat.testNiche
##D sp1 <- spp[1:32,2:3]
##D names(sp1)<-c("x","y")
##D occ.sp1 <- ecospat.occ.desaggregation(xy=sp1,min.dist=500)
##D clim <- ecospat.testData[2:8]
##D 
##D occ_sp1 <- na.exclude(ecospat.sample.envar(dfsp=occ.sp1,colspxy=1:2,colspkept=1:2,
##D                                             dfvar=clim,colvarxy=1:2,colvar="all",resolution=25))
## End(Not run)



