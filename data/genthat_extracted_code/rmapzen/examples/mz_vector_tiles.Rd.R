library(rmapzen)


### Name: mz_vector_tiles
### Title: Request vector tile data
### Aliases: mz_vector_tiles

### ** Examples

## Not run: 
##D # vector tile at x = 19293, y = 24641, and zoom level 16
##D mz_vector_tiles(mz_tile_coordinates(19293, 24641, 16))
##D 
##D # multiple contiguous tiles will be stitched together
##D # this returns the result of stitching together 4 tiles
##D mz_vector_tiles(mz_tile_coordinates(19293:19294, 24641:24642, 16))
##D 
##D # can also use a bounding box:
##D mz_vector_tiles(mz_rect(min_lon = -122.2856,
##D                         min_lat = 37.73742,
##D                         max_lon = -122.1749,
##D                         max_lat = 37.84632))
##D 
##D # mz_bbox returns a bounding box for any Mapzen object
##D mz_vector_tiles(mz_bbox(oakland_public))
##D 
##D # bounding boxes are automatically converted to tile coordinates,
##D # with the zoom level based on the desired size in pixels of the final map
##D mz_vector_tiles(mz_bbox(oakland_public), height = 750, width = 1000)
## End(Not run)




