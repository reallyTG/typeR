library(solrium)


### Name: solr_stats
### Title: Solr stats
### Aliases: solr_stats

### ** Examples

## Not run: 
##D # connect
##D (cli <- SolrClient$new(host = "api.plos.org", path = "search", port = NULL))
##D 
##D # get stats
##D solr_stats(cli, params = list(q='science', stats.field='counter_total_all'),
##D   raw=TRUE)
##D solr_stats(cli, params = list(q='title:"ecology" AND body:"cell"',
##D    stats.field=c('counter_total_all','alm_twitterCount')))
##D solr_stats(cli, params = list(q='ecology',
##D   stats.field=c('counter_total_all','alm_twitterCount'),
##D   stats.facet='journal'))
##D solr_stats(cli, params = list(q='ecology',
##D   stats.field=c('counter_total_all','alm_twitterCount'),
##D   stats.facet=c('journal','volume')))
##D 
##D # Get raw data, then parse later if you feel like it
##D ## json
##D out <- solr_stats(cli, params = list(q='ecology',
##D   stats.field=c('counter_total_all','alm_twitterCount'),
##D   stats.facet=c('journal','volume')), raw=TRUE)
##D library("jsonlite")
##D jsonlite::fromJSON(out)
##D solr_parse(out) # list
##D solr_parse(out, 'df') # data.frame
##D 
##D ## xml
##D out <- solr_stats(cli, params = list(q='ecology',
##D   stats.field=c('counter_total_all','alm_twitterCount'),
##D   stats.facet=c('journal','volume'), wt="xml"), raw=TRUE)
##D library("xml2")
##D xml2::read_xml(unclass(out))
##D solr_parse(out) # list
##D solr_parse(out, 'df') # data.frame
##D 
##D # Get verbose http call information
##D solr_stats(cli, params = list(q='ecology', stats.field='alm_twitterCount'),
##D    callopts=list(verbose=TRUE))
## End(Not run)



