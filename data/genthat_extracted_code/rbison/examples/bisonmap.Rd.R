library(rbison)


### Name: bisonmap
### Title: Make map to visualize BISON data.
### Aliases: bisonmap bisonmap.bison bisonmap.bison_solr

### ** Examples

## Not run: 
##D # Using function bison
##D library("ggplot2")
##D out <- bison(species="Accipiter", type="scientific_name", count=300)
##D bisonmap(input=out)
##D bisonmap(input=out, geom=geom_jitter, jitter=position_jitter(width = 0.3, 
##D   height = 0.3))
##D 
##D # Using function bison_solr
##D out <- bison_solr(scientificName='Ursus americanus', rows=200)
##D bisonmap(out)
## End(Not run)



