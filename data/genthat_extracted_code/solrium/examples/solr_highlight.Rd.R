library(solrium)


### Name: solr_highlight
### Title: Highlighting search
### Aliases: solr_highlight

### ** Examples

## Not run: 
##D # connect
##D (conn <- SolrClient$new(host = "api.plos.org", path = "search", port = NULL))
##D 
##D # highlight search
##D solr_highlight(conn, params = list(q='alcohol', hl.fl = 'abstract', rows=10),
##D   parsetype = "list")
##D solr_highlight(conn, params = list(q='alcohol', hl.fl = c('abstract','title'),
##D   rows=3), parsetype = "list")
##D 
##D # Raw data back
##D ## json
##D solr_highlight(conn, params = list(q='alcohol', hl.fl = 'abstract', rows=10),
##D    raw=TRUE)
##D ## xml
##D solr_highlight(conn, params = list(q='alcohol', hl.fl = 'abstract', rows=10,
##D    wt='xml'), raw=TRUE)
##D ## parse after getting data back
##D out <- solr_highlight(conn, params = list(q='theoretical math',
##D    hl.fl = c('abstract','title'), hl.fragsize=30, rows=10, wt='xml'),
##D    raw=TRUE)
##D solr_parse(out, parsetype='list')
## End(Not run)



