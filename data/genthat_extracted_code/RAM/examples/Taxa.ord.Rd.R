library(RAM)


### Name: Taxa.ord
### Title: Ordination Plot For Taxa Groups Using CCA or RDA Analysis
### Aliases: Taxa.ord Taxa.cca Taxa.rda
### Keywords: hplot

### ** Examples

data(ITS1, meta)
its1<- filter.OTU(data=list(ITS1=ITS1), percent=0.001)[[1]]
factors=c("City", "Crop", "Harvestmethod", "Ergosterol_ppm")
## Not run: 
##D ord <- Taxa.ord(its1,  meta=meta, data.trans="total",
##D         factors=factors, mode="cca", biplot.sig=0.1,
##D         taxa=20, biplot.scale=1.5, cex.point=5, cex.label=1,
##D         plot.species=TRUE, rank="g", plot.scaling=3,
##D         group=c(City="City", Crop="Crop"), biplot.label=FALSE)
##D names(ord)
## End(Not run)



