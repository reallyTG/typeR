library(solrium)


### Name: solr_group
### Title: Grouped search
### Aliases: solr_group

### ** Examples

## Not run: 
##D # connect
##D (cli <- SolrClient$new())
##D 
##D # by default we do a GET request
##D cli$group("gettingstarted",
##D   params = list(q='*:*', group.field='compName_s'))
##D # OR
##D solr_group(cli, "gettingstarted",
##D   params = list(q='*:*', group.field='compName_s'))
##D 
##D # connect
##D (cli <- SolrClient$new(host = "api.plos.org", path = "search", port = NULL))
##D 
##D # Basic group query
##D solr_group(cli, params = list(q='ecology', group.field='journal',
##D   group.limit=3, fl=c('id','score')))
##D solr_group(cli, params = list(q='ecology', group.field='journal',
##D   group.limit=3, fl='article_type'))
##D 
##D # Different ways to sort (notice diff btw sort of group.sort)
##D # note that you can only sort on a field if you return that field
##D solr_group(cli, params = list(q='ecology', group.field='journal', group.limit=3,
##D    fl=c('id','score')))
##D solr_group(cli, params = list(q='ecology', group.field='journal', group.limit=3,
##D    fl=c('id','score','alm_twitterCount'), group.sort='alm_twitterCount desc'))
##D solr_group(cli, params = list(q='ecology', group.field='journal', group.limit=3,
##D    fl=c('id','score','alm_twitterCount'), sort='score asc',
##D    group.sort='alm_twitterCount desc'))
##D 
##D # Two group.field values
##D out <- solr_group(cli, params = list(q='ecology', group.field=c('journal','article_type'),
##D   group.limit=3, fl='id'), raw=TRUE)
##D solr_parse(out)
##D solr_parse(out, 'df')
##D 
##D # Get two groups, one with alm_twitterCount of 0-10, and another group
##D # with 10 to infinity
##D solr_group(cli, params = list(q='ecology', group.limit=3, fl=c('id','alm_twitterCount'),
##D  group.query=c('alm_twitterCount:[0 TO 10]','alm_twitterCount:[10 TO *]')))
##D 
##D # Use of group.format and group.simple.
##D ## The raw data structure of these two calls are slightly different, but
##D ## the parsing inside the function outputs the same results. You can
##D ## of course set raw=TRUE to get back what the data actually look like
##D solr_group(cli, params = list(q='ecology', group.field='journal', group.limit=3,
##D   fl=c('id','score'), group.format='simple'))
##D solr_group(cli, params = list(q='ecology', group.field='journal', group.limit=3,
##D   fl=c('id','score'), group.format='grouped'))
##D solr_group(cli, params = list(q='ecology', group.field='journal', group.limit=3,
##D   fl=c('id','score'), group.format='grouped', group.main='true'))
##D 
##D # xml back
##D solr_group(cli, params = list(q='ecology', group.field='journal', group.limit=3,
##D   fl=c('id','score'), wt = "xml"))
##D solr_group(cli, params = list(q='ecology', group.field='journal', group.limit=3,
##D   fl=c('id','score'), wt = "xml"), parsetype = "list")
##D res <- solr_group(cli, params = list(q='ecology', group.field='journal', group.limit=3,
##D   fl=c('id','score'), wt = "xml"), raw = TRUE)
##D library("xml2")
##D xml2::read_xml(unclass(res))
##D 
##D solr_group(cli, params = list(q='ecology', group.field='journal', group.limit=3,
##D   fl='article_type', wt = "xml"))
##D solr_group(cli, params = list(q='ecology', group.field='journal', group.limit=3,
##D   fl='article_type', wt = "xml"), parsetype = "list")
## End(Not run)



