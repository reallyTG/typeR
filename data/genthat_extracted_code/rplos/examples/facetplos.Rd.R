library(rplos)


### Name: facetplos
### Title: Do faceted searches on PLOS Journals full-text content
### Aliases: facetplos

### ** Examples

## Not run: 
##D # Facet on a single field
##D facetplos(q='*:*', facet.field='journal')
##D facetplos(q='alcohol', facet.field='article_type')
##D 
##D # Facet on multiple fields
##D facetplos(q='alcohol', facet.field=c('journal','subject'))
##D 
##D # Using mincount
##D facetplos(q='alcohol', facet.field='journal', facet.mincount='500')
##D 
##D # Using facet.query to get counts
##D ## A single facet.query term
##D facetplos(q='*:*', facet.field='journal', facet.query='cell')
##D ## Many facet.query terms
##D facetplos(q='*:*', facet.field='journal', facet.query='cell,bird')
##D 
##D # Range faceting
##D facetplos(q='*:*', url=url, facet.range='counter_total_all',
##D    facet.range.start=5, facet.range.end=1000, facet.range.gap=10)
##D facetplos(q='alcohol', facet.range='alm_facebookCount', facet.range.start=1000,
##D    facet.range.end=5000, facet.range.gap = 100)
##D 
##D # Range faceting with > 1 field, same settings
##D facetplos(q='*:*', url=url, facet.range=c('counter_total_all','alm_twitterCount'),
##D  facet.range.start=5, facet.range.end=1000, facet.range.gap=10)
##D 
##D # Range faceting with > 1 field, different settings
##D facetplos(q='*:*', url=url, facet.range=c('counter_total_all','alm_twitterCount'),
##D  f.counter_total_all.facet.range.start=5, f.counter_total_all.facet.range.end=1000,
##D  f.counter_total_all.facet.range.gap=10, f.alm_twitterCount.facet.range.start=5,
##D  f.alm_twitterCount.facet.range.end=1000, f.alm_twitterCount.facet.range.gap=10)
## End(Not run)



