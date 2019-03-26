library(wgaim)


### Name: qtlTable
### Title: Stack QTL summary information into a super table
### Aliases: qtlTable
### Keywords: regression

### ** Examples


## Not run: 
##D 
##D ## fit wgaim models
##D 
##D rktgw.qtl <- wgaim(rktgw.asf, phenoData = phenoRxK, intervalObj = genoRxK,
##D merge.by = "Genotype", trace = "trace.txt", na.method.X = "include")
##D 
##D rkyld.qtl <- wgaim(rkyld.asf, phenoData = phenoRxK, intervalObj = genoRxK,
##D merge.by = "Genotype", trace = "trace.txt", na.method.X = "include")
##D 
##D ## create super table and export
##D 
##D qtlt <- qtlTable(rktgw.qtl, rkyld.qtl, labels = c("Conc.", "Shoot"))
##D print(xtable(qtlt), file = "superQTL.tex", include.rownames = FALSE)
## End(Not run)



