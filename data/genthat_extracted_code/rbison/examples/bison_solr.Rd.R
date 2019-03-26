library(rbison)


### Name: bison_solr
### Title: Search for and collect occurrence data from the USGS Bison API
###   using their solr endpoint.
### Aliases: bison_solr

### ** Examples

## Not run: 
##D x=bison_solr(scientificName='Ursus americanus')
##D 
##D bison_solr(scientificName='Ursus americanus', computedStateFips='02',
##D  fl="scientificName")
##D 
##D x <- bison_solr(scientificName='Ursus americanus', computedStateFips='02', rows=50)
##D x$points$computedStateFips
##D head(x$points)
##D 
##D bison_solr(ITISscientificName='Ursus americanus', rows=50)
##D 
##D bison_solr(providerID = 220)
##D 
##D # combining parameters
##D x <- bison_solr(eventDate = c('2008-01-01', '2010-12-31'), 
##D   ITISscientificName="Helianthus annuus", rows = 100)
##D head(x$points)
##D sort(x$points$eventDate)
##D 
##D # range queries
##D ## range search with providerID
##D bison_solr(providerID = c(220, 221))
##D ## date range search
##D x <- bison_solr(eventDate = c('2010-08-08', '2010-08-21'))
##D sort(x$points$eventDate)
##D ## TSN range search
##D x <- bison_solr(TSNs = c(174773, 174775), rows = 100)
##D sort(x$points$TSN)
##D ## can't do range searches with character strings (that are not dates)
##D # bison_solr(kingdom = c("Animalia", "Plantae"))
##D 
##D # more examples
##D bison_solr(TSNs = 174773)
##D bison_solr(occurrenceID = 576630651)
##D bison_solr(catalogNumber = 'OBS101299944')
##D bison_solr(ITIScommonName = "Canada goose")
##D bison_solr(kingdom = "Animalia")
##D bison_solr(kingdom = "Plantae")
##D 
##D # Mapping
##D out <- bison_solr(scientificName='Ursus americanus', rows=200)
##D bisonmap(out)
##D 
##D out <- bison_solr(scientificName='Helianthus annuus', rows=800)
##D bisonmap(out)
##D 
##D # Using additional solr fields
##D ## Faceting
##D bison_solr(scientificName='Helianthus annuus', rows=0, facet='true',
##D  facet.field='computedStateFips')
##D 
##D ## Highlighting
##D bison_solr(scientificName='Helianthus annuus', rows=10, hl='true',
##D  hl.fl='scientificName')
##D 
##D ## Use of hierarchy_homonym_string
##D bison_solr(hierarchy_homonym_string = '-202423-914154-914156-158852-')
##D ## -- This is a bit unwieldy, but you can find this string in the output 
##D ## of a call, like this
##D x <- bison_solr(scientificName='Ursus americanus', rows=1)
##D string <- x$points$hierarchy_homonym_string
##D bison_solr(hierarchy_homonym_string = string)
##D 
##D # The pointPath parameter
##D bison_solr(pointPath = '/-110.0,45.0/specimen')
##D 
##D # Curl options
##D bison_solr(scientificName='Ursus americanus', callopts=list(verbose = TRUE))
## End(Not run)



