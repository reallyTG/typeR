library(rdryad)


### Name: d_solr_search
### Title: Search the Dryad Solr endpoint.
### Aliases: d_solr_search d_solr_facet d_solr_group d_solr_highlight
###   d_solr_mlt d_solr_stats

### ** Examples

## Not run: 
##D # Basic search
##D d_solr_search(q="Galliard")
##D 
##D # Basic search, restricting to certain fields
##D d_solr_search(q="Galliard", fl=c('handle', 'dc.title_sort'))
##D 
##D # Search all text for a string, but limits results to two specified fields:
##D d_solr_search(q="dwc.ScientificName:drosophila", fl='handle,dc.title_sort')
##D 
##D # Dryad data based on an article DOI:
##D d_solr_search(q="dc.relation.isreferencedby:10.1038/nature04863",
##D    fl="dc.identifier,dc.title_ac")
##D 
##D # All terms in the dc.subject facet, along with their frequencies:
##D d_solr_facet(q="location:l2", facet.field="dc.subject_filter", facet.minCount=1,
##D    facet.limit=10)
##D 
##D # Article DOIs associated with all data published in Dryad over the past 90 days:
##D d_solr_search(q="dc.date.available_dt:[NOW-90DAY/DAY TO NOW]",
##D    fl="dc.relation.isreferencedby", rows=10)
##D 
##D # Data DOIs published in Dryad during January 2011
##D query <- "location:l2 dc.date.available_dt:[2011-01-01T00:00:00Z TO 2011-01-31T23:59:59Z]"
##D d_solr_search(q=query, fl="dc.identifier", rows=10)
##D 
##D # Highlight
##D d_solr_highlight(q="bird", hl.fl="dc.description")
##D 
##D # More like this
##D d_solr_mlt(q="bird", mlt.count=10, mlt.fl='dc.title_sort', fl='handle,dc.title_sort')
##D 
##D # Stats
##D d_solr_stats(q="*:*", stats.field="dc.date.accessioned.year")
## End(Not run)



