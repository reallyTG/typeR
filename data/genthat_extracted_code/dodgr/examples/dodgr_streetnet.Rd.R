library(dodgr)


### Name: dodgr_streetnet
### Title: dodgr_streetnet
### Aliases: dodgr_streetnet

### ** Examples

## Not run: 
##D streetnet <- dodgr_streetnet ("hampi india", expand = 0)
##D # convert to form needed for `dodgr` functions:
##D graph <- weight_streetnet (streetnet)
##D nrow (graph) # 5,742 edges
##D # Alternative ways of extracting street networks by using a small selection of
##D # graph vertices to define bounding box:
##D verts <- dodgr_vertices (graph)
##D verts <- verts [sample (nrow (verts), size = 200), ]
##D streetnet <- dodgr_streetnet (pts = verts, expand = 0)
##D graph <- weight_streetnet (streetnet)
##D nrow (graph)
##D # This will generally have many more rows because most street networks include
##D # streets that extend considerably beyond the specified bounding box.
##D 
##D # bbox can also be a polygon:
##D bb <- osmdata::getbb ("gent belgium") # rectangular bbox
##D nrow (dodgr_streetnet (bbox = bb)) # 28,742
##D bb <- osmdata::getbb ("gent belgium", format_out = "polygon")
##D nrow (dodgr_streetnet (bbox = bb)) # 15,969
##D # The latter has fewer rows because only edges within polygon are returned
## End(Not run)



