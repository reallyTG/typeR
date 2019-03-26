library(solrium)


### Name: solr_facet
### Title: Faceted search
### Aliases: solr_facet

### ** Examples

## Not run: 
##D # connect - local Solr instance
##D (cli <- SolrClient$new())
##D cli$facet("gettingstarted", params = list(q="*:*", facet.field='name'))
##D cli$facet("gettingstarted", params = list(q="*:*", facet.field='name'),
##D   callopts = list(verbose = TRUE))
##D cli$facet("gettingstarted", body = list(q="*:*", facet.field='name'),
##D   callopts = list(verbose = TRUE))
##D 
##D # Facet on a single field
##D solr_facet(cli, "gettingstarted", params = list(q='*:*', facet.field='name'))
##D 
##D # Remote instance
##D (cli <- SolrClient$new(host = "api.plos.org", path = "search", port = NULL))
##D 
##D # Facet on multiple fields
##D solr_facet(cli, params = list(q='alcohol',
##D   facet.field = c('journal','subject')))
##D 
##D # Using mincount
##D solr_facet(cli, params = list(q='alcohol', facet.field='journal',
##D   facet.mincount='500'))
##D 
##D # Using facet.query to get counts
##D solr_facet(cli, params = list(q='*:*', facet.field='journal',
##D   facet.query=c('cell','bird')))
##D 
##D # Using facet.pivot to simulate SQL group by counts
##D solr_facet(cli, params = list(q='alcohol', facet.pivot='journal,subject',
##D              facet.pivot.mincount=10))
##D ## two or more fields are required - you can pass in as a single
##D ## character string
##D solr_facet(cli, params = list(q='*:*', facet.pivot = "journal,subject",
##D   facet.limit =  3))
##D ## Or, pass in as a vector of length 2 or greater
##D solr_facet(cli, params = list(q='*:*', facet.pivot = c("journal", "subject"),
##D   facet.limit =  3))
##D 
##D # Date faceting
##D solr_facet(cli, params = list(q='*:*', facet.date='publication_date',
##D   facet.date.start='NOW/DAY-5DAYS', facet.date.end='NOW',
##D   facet.date.gap='+1DAY'))
##D ## two variables
##D solr_facet(cli, params = list(q='*:*',
##D   facet.date=c('publication_date', 'timestamp'),
##D   facet.date.start='NOW/DAY-5DAYS', facet.date.end='NOW',
##D   facet.date.gap='+1DAY'))
##D 
##D # Range faceting
##D solr_facet(cli, params = list(q='*:*', facet.range='counter_total_all',
##D   facet.range.start=5, facet.range.end=1000, facet.range.gap=10))
##D 
##D # Range faceting with > 1 field, same settings
##D solr_facet(cli, params = list(q='*:*',
##D   facet.range=c('counter_total_all','alm_twitterCount'),
##D   facet.range.start=5, facet.range.end=1000, facet.range.gap=10))
##D 
##D # Range faceting with > 1 field, different settings
##D solr_facet(cli, params = list(q='*:*',
##D   facet.range=c('counter_total_all','alm_twitterCount'),
##D   f.counter_total_all.facet.range.start=5,
##D   f.counter_total_all.facet.range.end=1000,
##D   f.counter_total_all.facet.range.gap=10,
##D   f.alm_twitterCount.facet.range.start=5,
##D   f.alm_twitterCount.facet.range.end=1000,
##D   f.alm_twitterCount.facet.range.gap=10))
##D 
##D # Get raw json or xml
##D ## json
##D solr_facet(cli, params = list(q='*:*', facet.field='journal'), raw=TRUE)
##D ## xml
##D solr_facet(cli, params = list(q='*:*', facet.field='journal', wt='xml'),
##D   raw=TRUE)
##D 
##D # Get raw data back, and parse later, same as what goes on internally if
##D # raw=FALSE (Default)
##D out <- solr_facet(cli, params = list(q='*:*', facet.field='journal'),
##D   raw=TRUE)
##D solr_parse(out)
##D out <- solr_facet(cli, params = list(q='*:*', facet.field='journal',
##D   wt = 'xml'), raw=TRUE)
##D solr_parse(out)
##D 
##D # Using the USGS BISON API (https://bison.usgs.gov/#solr)
##D ## The occurrence endpoint
##D (cli <- SolrClient$new(host = "bison.usgs.gov", scheme = "https",
##D   path = "solr/occurrences/select", port = NULL))
##D solr_facet(cli, params = list(q='*:*', facet.field='year'))
##D solr_facet(cli, params = list(q='*:*', facet.field='computedStateFips'))
##D 
##D # using a proxy
##D # cli <- SolrClient$new(host = "api.plos.org", path = "search", port = NULL,
##D #   proxy = list(url = "http://54.195.48.153:8888"))
##D # solr_facet(cli, params = list(facet.field='journal'),
##D #   callopts=list(verbose=TRUE))
## End(Not run)



