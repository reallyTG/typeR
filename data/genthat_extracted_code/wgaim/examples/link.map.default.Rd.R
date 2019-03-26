library(wgaim)


### Name: link.map.default
### Title: Plot a genetic linkage map with QTL for multiple traits
### Aliases: link.map.default
### Keywords: hplot

### ** Examples


## Not run: 
##D ## fit wgaim models
##D 
##D rktgw.qtl <- wgaim(rktgw.asf, phenoData = phenoRxK, intervalObj = genoRxK,
##D merge.by = "Genotype", trace = "trace.txt", na.method.X = "include")
##D 
##D rkyld.qtl <- wgaim(rkyld.asf, phenoData = phenoRxK, intervalObj = genoRxK,
##D merge.by = "Genotype", trace = "trace.txt", na.method.X = "include")
##D 
##D ## plot QTL intervals
##D 
##D # matching rainbow QTL color and trait names, red flanking markers
##D # (default) and gray background markers.
##D 
##D link.map(list(rktgw.qtl,rkyld.qtl), genoRxK, col = "gray")
##D 
##D # rainbow QTL color and black trait names, red flanking markers
##D # (default) and gray background markers.
##D 
##D link.map(list(rktgw.qtl,rkyld.qtl), genoRxK, list.col = list(t.col =
##D "black", m.col = "red"), col = "gray")
##D 
##D # monochromatic plot: gray QTLs, black trait names, black flanking
##D # markers and gray background markers
##D 
##D link.map(list(rktgw.qtl,rkyld.qtl), genoRxK, list.col = list(q.col =
##D rep(gray(0.8), 2), t.col = "black", mcol = "black"), col = "gray")
##D 
## End(Not run)



