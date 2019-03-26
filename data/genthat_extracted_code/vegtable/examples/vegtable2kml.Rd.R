library(vegtable)


### Name: vegtable2kml
### Title: Mapping of plot observations.
### Aliases: vegtable2kml vegtable2kml,data.frame-method
###   vegtable2kml,vegtable-method
### Keywords: methods

### ** Examples

library(vegtable)
data(Kenya_veg)

## Plots containing Podocarpus observations
Kenya_veg@species <- subset(Kenya_veg@species, grepl("Podocarpus", TaxonName),
	slot="names")
	
Kenya_veg <- subset(Kenya_veg, TaxonUsageID %in%
	Kenya_veg@species@taxonNames$TaxonUsageID, slot="samples")

## Not run: vegtable2kml(Kenya_veg, "Podocarpus.kml")



