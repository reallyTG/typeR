library(wgaim)


### Name: tr.wgaim
### Title: Display diagnostic information about wgaim QTL model
### Aliases: tr tr.wgaim
### Keywords: regression

### ** Examples


## Not run: 
##D # read in data
##D 
##D data(phenoRxK, package = "wgaim")
##D data(genoRxK, package = "wgaim")
##D 
##D # subset linkage map and convert to "interval" object
##D 
##D genoRxK <- subset(genoRxK, chr = c("1A", "2D1", "2D2", "3B"))
##D genoRxK <- cross2int(genoRxK, missgeno = "Martinez",
##D                     id = "Genotype", map.function = "kosambi")
##D 
##D # base model
##D 
##D rkyld.asf <- asreml(yld ~ Type + lrow, random = ~ Genotype + Range,
##D                    rcov = ~ ar1(Range):ar1(Row), data = phenoRxK)
##D 
##D # find QTL
##D 
##D rkyld.qtl <- wgaim(rkyld.asf, phenoData = phenoRxK, intervalObj = genoRxK,
##D    merge.by = "Genotype", gen.type = "interval", method = "fixed",
##D    selection = "interval", trace = "trace.txt", na.method.X = "include")
##D 
##D # diagnostic check
##D 
##D tr(rkyld.qtl, digits = 4)
## End(Not run)



