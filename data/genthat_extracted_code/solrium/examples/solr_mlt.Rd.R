library(solrium)


### Name: solr_mlt
### Title: "more like this" search
### Aliases: solr_mlt

### ** Examples

## Not run: 
##D # connect
##D (conn <- SolrClient$new(host = "api.plos.org", path = "search", port = NULL))
##D 
##D # more like this search
##D conn$mlt(params = list(q='*:*', mlt.count=2, mlt.fl='abstract', fl='score',
##D   fq="doc_type:full"))
##D conn$mlt(params = list(q='*:*', rows=2, mlt.fl='title', mlt.mindf=1,
##D   mlt.mintf=1, fl='alm_twitterCount'))
##D conn$mlt(params = list(q='title:"ecology" AND body:"cell"', mlt.fl='title',
##D   mlt.mindf=1, mlt.mintf=1, fl='counter_total_all', rows=5))
##D conn$mlt(params = list(q='ecology', mlt.fl='abstract', fl='title', rows=5))
##D solr_mlt(conn, params = list(q='ecology', mlt.fl='abstract',
##D   fl=c('score','eissn'), rows=5))
##D solr_mlt(conn, params = list(q='ecology', mlt.fl='abstract',
##D   fl=c('score','eissn'), rows=5, wt = "xml"))
##D 
##D # get raw data, and parse later if needed
##D out <- solr_mlt(conn, params=list(q='ecology', mlt.fl='abstract', fl='title',
##D  rows=2), raw=TRUE)
##D solr_parse(out, "df")
## End(Not run)



