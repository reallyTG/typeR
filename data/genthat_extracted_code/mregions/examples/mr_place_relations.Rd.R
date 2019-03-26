library(mregions)


### Name: mr_place_relations
### Title: Related records
### Aliases: mr_place_relations

### ** Examples

## Not run: 
##D ## geocode to get geospatial data for a place name
##D (tikehau <- mr_geo_code("tikehau"))
##D 
##D ## then pass in in an MRGID as the first parameter
##D mr_place_relations(tikehau$MRGID)
##D 
##D ## Set direction='both'
##D mr_place_relations(tikehau$MRGID, direction = "both")
##D 
##D ## Set type to various other options
##D mr_place_relations(307, type = "adjacentto")
##D mr_place_relations(414, type = "similarto")
##D mr_place_relations(4177, type = "all")
## End(Not run)



