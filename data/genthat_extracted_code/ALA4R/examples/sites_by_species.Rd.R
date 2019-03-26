library(ALA4R)


### Name: sites_by_species
### Title: Sites by species
### Aliases: sites_by_species

### ** Examples

## Not run: 
##D # Eucalyptus in Tasmania based on a 0.1 degree grid
##D ss <- sites_by_species(taxon="genus:Eucalyptus", wkt="POLYGON((144 -43,148 -43,148 -40,
##D   144 -40,144 -43))", gridsize=0.1, verbose=TRUE)
##D head(ss[, 1:6])
##D # equivalent direct POST webservice call:
##D # http://spatial.ala.org.au/alaspatial/ws/sitesbyspecies?speciesq=genus:Eucalyptus&qname=data&
##D #  area=POLYGON((144%20-43,148%20-43,148%20-40,144%20-40,144%20-43))&bs=http://biocache.ala.org.au/
##D #  ws/&movingaveragesize=1&gridsize=0.1&sitesbyspecies=1
##D 
##D ## get the guid of the first species
##D attr(ss,"guid")[1]
## End(Not run)



