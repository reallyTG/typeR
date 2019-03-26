library(biclust)


### Name: jaccardind
### Title: Jaccardind
### Aliases: jaccardind jaccard2
### Keywords: cluster

### ** Examples

## Not run: 
##D data(BicatYeast)
##D res1<-biclust(BicatYeast, method=BCPlaid(), back.fit = 2, shuffle = 3,
##D   fit.model = ~m + a + b,iter.startup = 5, iter.layer = 30,  verbose = TRUE)
##D res2<-biclust(BicatYeast, method=BCCC())
##D jaccardind(res1,res2)
##D 
## End(Not run)



