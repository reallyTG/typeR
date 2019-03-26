library(RAM)


### Name: pcoa.plot
### Title: Create a PCoA plot for an OTU Table
### Aliases: pcoa.plot
### Keywords: hplot

### ** Examples

data(ITS1, meta)
# The argument for factors is a vector of length two; the first
# item is # Crop, which is a column from meta, and the second 
# item is City, another # column from meta.
pcoa.plot(ITS1, meta=meta, rank="c",
          factors=c(Crop="Crop", City="City"))
## Not run: 
##D # If you want to customize legend labels and plot the top 20 
##D # taxon groups at genus:
##D pcoa.plot(ITS1, meta=meta, rank="g", main="PCoA plot",
##D           factors=c(Place="City", 
##D           Harvest_Method="Harvestmethod"))
##D # In black & white, using base graphics:
##D pcoa.plot(ITS1, meta=meta, rank="c", factors=c(Plot="Plots"),
##D           ggplot=F, bw=T)
##D pcoa.plot(ITS1, meta=meta, rank="c", factors=c(Plot="Plots"),
##D           ggplot=F, bw=T, dist.method="euc", 
##D           stand.method="hell")
##D # Focus on the samples: hide all groups and plot ellipses 
##D # for Crop:
##D pcoa.plot(ITS1, meta=meta, rank="g",
##D           factors=c(Crop="Crop", City="City"),
##D           ellipse=1, sample.labels=FALSE, top=0)
##D # Standardize the data before calculating distances:
##D pcoa.plot(ITS1, meta=meta, rank="g", factors=c(City="City"),
##D           stand.method="chi.square",
##D           dist.method="euclidean")
## End(Not run)



