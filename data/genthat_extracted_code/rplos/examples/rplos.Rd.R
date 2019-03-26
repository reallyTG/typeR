library(rplos)


### Name: rplos
### Title: Connect with PLoS API data
### Aliases: rplos rplos-package
### Keywords: package

### ** Examples

## Not run: 
##D searchplos(q='ecology', fl=c('id','publication_date'), limit = 2)
##D 
##D # Get only full article DOIs
##D out <- searchplos(q="*:*", fl='id', fq='doc_type:full', start=0, limit=250)
##D head(out$data)
##D 
##D # Get DOIs for only PLoS One articles
##D out <- searchplos(q="*:*", fl='id', fq='journal_key:PLoSONE',
##D   start=0, limit=15)
##D head(out$data)
## End(Not run)




