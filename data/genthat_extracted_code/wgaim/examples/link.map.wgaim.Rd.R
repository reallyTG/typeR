library(wgaim)


### Name: link.map.wgaim
### Title: Plot a genetic linkage map with QTL's
### Aliases: link.map.wgaim
### Keywords: hplot

### ** Examples


## Not run: 
##D # fit wgaim model
##D 
##D yield.qtl <- wgaim(yield.fm, phenoData = phenoRxK, intervalObj = genoRxK,
##D merge.by = "Genotype", trace = "trace.txt", na.method.X = "include")
##D 
##D # plot QTL
##D 
##D link.map(yield.qtl, genoRxK, list.col = list(m.col = "red"), col = "gray")
##D 
## End(Not run)



