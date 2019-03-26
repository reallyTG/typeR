library(ritis)


### Name: itis_facet
### Title: ITIS Solr facet
### Aliases: itis_facet

### ** Examples

## Not run: 
##D itis_facet(q = "rank:Species", rows = 0, facet.field = "kingdom")$facet_fields
##D 
##D x <- itis_facet(q = "hierarchySoFar:*$Aves$* AND rank:Species AND usage:valid",
##D    facet.pivot = "nameWInd,vernacular", facet.limit = -1, facet.mincount = 1,
##D    rows = 0)
##D head(x$facet_pivot$`nameWInd,vernacular`)
## End(Not run)



