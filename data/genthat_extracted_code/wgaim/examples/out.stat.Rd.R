library(wgaim)


### Name: out.stat
### Title: Plot the blups or interval outlier statistics from specififed
###   iteratons of wgaim
### Aliases: out.stat
### Keywords: hplot

### ** Examples


## Not run: 
##D # fit wgaim model
##D 
##D rkyld.qtl <- wgaim(rkyld.asf, phenoData = phenoRxK, intervalObj = genoRxK,
##D merge.by = "Genotype", trace = "trace.txt", na.method.X = "include")
##D 
##D # plot QTL interval outlier statistics
##D 
##D out.stat(rkyld.qtl, genoRxK, iter = 1:5, cex = 0.4)
##D 
## End(Not run)



