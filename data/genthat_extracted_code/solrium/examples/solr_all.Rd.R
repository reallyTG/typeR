library(solrium)


### Name: solr_all
### Title: All purpose search
### Aliases: solr_all

### ** Examples

## Not run: 
##D # connect
##D (cli <- SolrClient$new(host = "api.plos.org", path = "search", port = NULL))
##D 
##D solr_all(cli, params = list(q='*:*', rows=2, fl='id'))
##D 
##D # facets
##D solr_all(cli, params = list(q='*:*', rows=2, fl='id', facet="true",
##D   facet.field="journal"))
##D 
##D # mlt
##D solr_all(cli, params = list(q='ecology', rows=2, fl='id', mlt='true',
##D   mlt.count=2, mlt.fl='abstract'))
##D 
##D # facets and mlt
##D solr_all(cli, params = list(q='ecology', rows=2, fl='id', facet="true",
##D   facet.field="journal", mlt='true', mlt.count=2, mlt.fl='abstract'))
##D 
##D # stats
##D solr_all(cli, params = list(q='ecology', rows=2, fl='id', stats='true',
##D   stats.field='counter_total_all'))
##D 
##D # facets, mlt, and stats
##D solr_all(cli, params = list(q='ecology', rows=2, fl='id', facet="true",
##D   facet.field="journal", mlt='true', mlt.count=2, mlt.fl='abstract',
##D   stats='true', stats.field='counter_total_all'))
##D 
##D # group
##D solr_all(cli, params = list(q='ecology', rows=2, fl='id', group='true',
##D  group.field='journal', group.limit=3))
##D 
##D # facets, mlt, stats, and groups
##D solr_all(cli, params = list(q='ecology', rows=2, fl='id', facet="true",
##D  facet.field="journal", mlt='true', mlt.count=2, mlt.fl='abstract',
##D  stats='true', stats.field='counter_total_all', group='true',
##D  group.field='journal', group.limit=3))
##D 
##D # using wt = xml
##D solr_all(cli, params = list(q='*:*', rows=50, fl=c('id','score'),
##D   fq='doc_type:full', wt="xml"), raw=TRUE)
## End(Not run)



