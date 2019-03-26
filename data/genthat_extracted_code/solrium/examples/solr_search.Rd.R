library(solrium)


### Name: solr_search
### Title: Solr search
### Aliases: solr_search

### ** Examples

## Not run: 
##D # Connect to a local Solr instance
##D (cli <- SolrClient$new())
##D cli$search("gettingstarted", params = list(q = "features:notes"))
##D 
##D solr_search(cli, "gettingstarted")
##D solr_search(cli, "gettingstarted", params = list(q = "features:notes"))
##D solr_search(cli, "gettingstarted", body = list(query = "features:notes"))
##D 
##D (cli <- SolrClient$new(host = "api.plos.org", path = "search", port = NULL))
##D cli$search(params = list(q = "*:*"))
##D cli$search(params = list(q = "title:golgi", fl = c('id', 'title')))
##D 
##D cli$search(params = list(q = "*:*", facet = "true"))
##D 
##D 
##D # search
##D solr_search(cli, params = list(q='*:*', rows=2, fl='id'))
##D 
##D # search and return all rows
##D solr_search(cli, params = list(q='*:*', rows=-1, fl='id'))
##D 
##D # Search for word ecology in title and cell in the body
##D solr_search(cli, params = list(q='title:"ecology" AND body:"cell"',
##D   fl='title', rows=5))
##D 
##D # Search for word "cell" and not "body" in the title field
##D solr_search(cli, params = list(q='title:"cell" -title:"lines"', fl='title',
##D   rows=5))
##D 
##D # Wildcards
##D ## Search for word that starts with "cell" in the title field
##D solr_search(cli, params = list(q='title:"cell*"', fl='title', rows=5))
##D 
##D # Proximity searching
##D ## Search for words "sports" and "alcohol" within four words of each other
##D solr_search(cli, params = list(q='everything:"sports alcohol"~7',
##D   fl='abstract', rows=3))
##D 
##D # Range searches
##D ## Search for articles with Twitter count between 5 and 10
##D solr_search(cli, params = list(q='*:*', fl=c('alm_twitterCount','id'),
##D   fq='alm_twitterCount:[5 TO 50]', rows=10))
##D 
##D # Boosts
##D ## Assign higher boost to title matches than to body matches
##D ## (compare the two calls)
##D solr_search(cli, params = list(q='title:"cell" abstract:"science"',
##D   fl='title', rows=3))
##D solr_search(cli, params = list(q='title:"cell"^1.5 AND abstract:"science"',
##D   fl='title', rows=3))
##D 
##D # FunctionQuery queries
##D ## This kind of query allows you to use the actual values of fields to
##D ## calculate relevancy scores for returned documents
##D 
##D ## Here, we search on the product of counter_total_all and alm_twitterCount
##D ## metrics for articles in PLOS Journals
##D solr_search(cli, params = list(q="{!func}product($v1,$v2)",
##D   v1 = 'sqrt(counter_total_all)',
##D   v2 = 'log(alm_twitterCount)', rows=5, fl=c('id','title'),
##D   fq='doc_type:full'))
##D 
##D ## here, search on the product of counter_total_all and alm_twitterCount,
##D ## using a new temporary field "_val_"
##D solr_search(cli,
##D   params = list(q='_val_:"product(counter_total_all,alm_twitterCount)"',
##D   rows=5, fl=c('id','title'), fq='doc_type:full'))
##D 
##D ## papers with most citations
##D solr_search(cli, params = list(q='_val_:"max(counter_total_all)"',
##D    rows=5, fl=c('id','counter_total_all'), fq='doc_type:full'))
##D 
##D ## papers with most tweets
##D solr_search(cli, params = list(q='_val_:"max(alm_twitterCount)"',
##D    rows=5, fl=c('id','alm_twitterCount'), fq='doc_type:full'))
##D 
##D ## many fq values
##D solr_search(cli, params = list(q="*:*", fl=c('id','alm_twitterCount'),
##D    fq=list('doc_type:full','subject:"Social networks"',
##D            'alm_twitterCount:[100 TO 10000]'),
##D    sort='counter_total_month desc'))
##D 
##D ## using wt = csv
##D solr_search(cli, params = list(q='*:*', rows=50, fl=c('id','score'),
##D   fq='doc_type:full', wt="csv"))
##D solr_search(cli, params = list(q='*:*', rows=50, fl=c('id','score'),
##D   fq='doc_type:full'))
##D 
##D # using a proxy
##D # cli <- SolrClient$new(host = "api.plos.org", path = "search", port = NULL,
##D #   proxy = list(url = "http://186.249.1.146:80"))
##D # solr_search(cli, q='*:*', rows=2, fl='id', callopts=list(verbose=TRUE))
##D 
##D # Pass on curl options to modify request
##D ## verbose
##D solr_search(cli, params = list(q='*:*', rows=2, fl='id'),
##D   callopts = list(verbose=TRUE))
## End(Not run)



