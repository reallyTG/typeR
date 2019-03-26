library(rdpla)


### Name: dpla_items
### Title: Search items from the Digital Public Library of America (DPLA).
### Aliases: dpla_items

### ** Examples

## Not run: 
##D # Basic search, "fruit" in any fields
##D dpla_items(q="fruit")
##D 
##D # Limit records returned
##D dpla_items(q="fruit", page_size=2)
##D 
##D # Return certain fields
##D dpla_items(q="fruit", fields=c("id","publisher","format"))
##D dpla_items(q="fruit", fields="subject")
##D 
##D # Max is 500 per call, but you can use combo of page_size and page params
##D dpla_items(q="fruit", fields="id", page_size=500)$meta$returned
##D lapply(1:2, function(x) {
##D    dpla_items(q="fruit", fields="id", page_size=500, page=x)$meta$returned
##D })
##D out <- lapply(1:2, function(x) dpla_items(q="fruit", fields="id",
##D    page_size=500, page=x))
##D lapply(out, function(y) head(y$data))
##D 
##D # Search by date
##D out <- dpla_items(q="science", date_before=1900, page_size=200)
##D out$data
##D 
##D # Search by various fields
##D dpla_items(description="obituaries", page_size=2, fields="description")
##D dpla_items(title="obituaries", page_size=2, fields="title")
##D dpla_items(subject="yodeling", page_size=2, fields="subject")
##D dpla_items(creator="Holst-Van der Schalk", page_size=2, fields="creator")
##D dpla_items(type="text", page_size=2, fields="type")
##D dpla_items(publisher="Leningrad", page_size=2, fields="publisher")
##D dpla_items(rights="unrestricted", page_size=2, fields="rights")
##D dpla_items(provider="HathiTrust", page_size=2, fields="provider")
##D 
##D ## don't seem to work
##D # dpla_items(contributor="Smithsonian", page_size=2, fields="contributor")
##D # dpla_items(format="Electronic resource", page_size=2, fields="format")
##D 
##D # Spatial search
##D ## sp searches all spatial fields, or search on specific fields, see those
##D ## params with sp_*
##D dpla_items(sp='Boston', page_size=2)
##D dpla_items(sp_state='Hawaii', page_size=2)
##D dpla_items(sp_state='Massachusetts OR Hawaii', page_size=2)
##D dpla_items(sp_coordinates='40,-100', page_size=2)
##D dpla_items(sp_country='Canada', page_size=2)
##D dpla_items(sp_county='Sacramento', page_size=2)
##D 
##D # Language search
##D dpla_items(language='Russian')$meta
##D dpla_items(language='rus')$meta
##D dpla_items(language='English')$meta
##D 
##D # Sorting
##D dpla_items(fields=c("id","title"), page_size=10)
##D dpla_items(fields=c("id","title"), page_size=10,
##D   sort_by="sourceResource.title")
##D 
##D # Faceting
##D dpla_items(facets="sourceResource.format", page_size=0)
##D dpla_items(facets="sourceResource.format", page_size=0, facet_size=5)
##D ids <- c("sourceResource.spatial.state","sourceResource.spatial.country")
##D dpla_items(facets=ids, page_size=0)
##D dpla_items(facets="sourceResource.type", page_size=0)
##D #dpla_items(facets="sourceResource.spatial.coordinates:42.3:-71",
##D #   page_size=0)
##D #dpla_items(facets="sourceResource.temporal.begin", page_size=0)
##D dpla_items(facets="provider.name", page_size=0)
##D dpla_items(facets="isPartOf", page_size=0)
##D dpla_items(facets="hasView", page_size=0)
## End(Not run)



