library(RAM)


### Name: phylo_taxonomy
### Title: Plot Hierarchical Taxonomic Tree with Relative Abundance
### Aliases: phylo_taxonomy
### Keywords: models

### ** Examples

data(ITS1, meta)
## Not run: 
##D ITS1.1<-filter.OTU(data=list(ITS1=ITS1), percent=0.01)[1]
##D factors=c("Crop", "City")
##D res<-phylo_taxonomy(otu=ITS1, meta=meta, factors=factors,
##D                     rank="order", rank.sep="; ", tip.offset=0,
##D                     x.lim=NULL, thermo=FALSE, cex=0.5,
##D                     tip.cex=0.5)
##D names(res)
##D require("plotKML")
##D par(mfrow=c(1,2))
##D for (i in 1:length(factors)) {
##D   display.pal(res[[1]][[i]])
##D }
##D par()
## End(Not run)



