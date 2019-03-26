library(rdatacite)


### Name: dc_search
### Title: DataCite Solr web service for search, facet, stats, and mlt
###   queries
### Aliases: dc_search dc_facet dc_stats dc_mlt

### ** Examples

library(crul)
url <- "https://search.datacite.org/api"
if (crul::HttpClient$new(url=url)$get()$success()) {

# Search
## various searches
### containing laser
dc_search(q = "laser", fl=c('doi','publicationYear'), rows=5)

### containing laser and safety
dc_search(q = "laser safety", fl=c('doi','publicationYear'),
  rows=5)

### containing laser and not medicine
dc_search(q = "laser -medicine", fl=c('doi',
  'publicationYear'), rows=5)

}

## Not run: 
##D ### containing laser and red or green
##D dc_search(q = "laser AND (red OR green)", fl=c('doi',
##D   'publicationYear'), rows=5)
##D 
##D ### containing wind turbine as a phrase in the title
##D dc_search(q = 'title:"wind turbine"', fl=c('doi','title'),
##D   rows=5)
##D 
##D ### containing geology in metadata field subject
##D dc_search(q = "subject:geology", fl=c('doi','subject'),
##D   rows=5)
##D 
##D ### belonging to DataCite members BL or TIB
##D dc_search(q = "allocator:(BL OR TIB)", fl=c('doi','allocator'),
##D   rows=5)
##D 
##D ### published between 2000 and 2005
##D dc_search(q = "publicationYear:[2000 TO 2005]",
##D   fl=c('doi','publicationYear'), rows=5)
##D 
##D ### uploaded to DataCite in the last 5 days
##D dc_search(q = "uploaded:[NOW-5DAYS TO NOW]",
##D   fl=c('doi','uploaded'), rows=5)
##D 
##D ## search with csv output
##D ### If you want to use wt=csv, install development version of
##D ### solr package, see Details
##D dc_search(q = 'wind', fl=c('doi','title'), wt='csv')
##D 
##D # Faceting
##D dc_facet(q = "wind", facet.field='publisher_facet')
##D 
##D # Stats
##D dc_stats(q = "ecology", stats.field='date')
##D 
##D # More like this (aka mlt)
##D dc_mlt(q = "ecology", mlt.fl='title', mlt.count=5,
##D   fl=c('doi','title'))
##D 
## End(Not run)



