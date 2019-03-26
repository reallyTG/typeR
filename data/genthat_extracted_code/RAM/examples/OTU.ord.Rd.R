library(RAM)


### Name: OTU.ord
### Title: Ordination Plot For OTUs Using CCA or RDA Analysis
### Aliases: OTU.ord OTU.cca OTU.rda
### Keywords: hplot

### ** Examples

data(ITS1, meta)
its1<- filter.OTU(data=list(ITS1=ITS1), percent=0.001)[[1]]
factors=c("City", "Crop", "Harvestmethod", "Ergosterol_ppm")
## Not run: 
##D # plot sites
##D ord1 <- OTU.ord(its1,  meta=meta, data.trans="total",
##D         factors=factors, mode="cca", biplot.sig=0.1,
##D         taxa=20, biplot.scale=1.5, cex.point=5,
##D         plot.species=FALSE, rank="f", plot.scaling=3,
##D         group=c(City="City", Crop="Crop"))
##D # plot taxa
##D ord2 <- OTU.ord(its1,  meta=meta, data.trans="total", 
##D         plot.scaling=-1,
##D         factors=factors, mode="cca", biplot.sig=0.1,
##D         taxa=20, biplot.scale=3, cex.point=3,
##D         plot.species=TRUE, rank="g")
## End(Not run)



