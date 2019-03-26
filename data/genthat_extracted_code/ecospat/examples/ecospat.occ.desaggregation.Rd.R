library(ecospat)


### Name: ecospat.occ.desaggregation
### Title: Species Occurrences Desaggregation
### Aliases: ecospat.occ.desaggregation

### ** Examples


## Not run: 
##D spp <- ecospat.testNiche
##D colnames(spp)[2:3] <- c('x','y')
##D sp1 <- spp[1:32,2:3]
##D 
##D occ.sp1 <- ecospat.occ.desaggregation(xy=sp1, min.dist=500, by=NULL)
##D occ.all.sp <- ecospat.occ.desaggregation(xy=spp, min.dist=500, by='Spp')
## End(Not run)



