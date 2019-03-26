library(sharpshootR)


### Name: SoilTaxonomyDendrogram
### Title: Soil Taxonomy Dendrogram
### Aliases: SoilTaxonomyDendrogram
### Keywords: hplots

### ** Examples

## Not run: 
##D library(soilDB)
##D 
##D # soils of interest
##D s.list <- c('musick', 'cecil', 'drummer', 'amador', 'pentz', 'reiff', 
##D 'san joaquin','montpellier','grangeville','pollasky','ramona')
##D 
##D # fetch and convert data into an SPC
##D h <- fetchOSD(s.list)
##D 
##D # plot dendrogram + profiles
##D SoilTaxonomyDendrogram(h)
##D 
##D # again, this time save the pair-wise dissimilarity matrix
##D # note that there isn't a lot of discrimination between soils
##D (d <- SoilTaxonomyDendrogram(h))
## End(Not run)



