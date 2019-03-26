library(MazamaSpatialUtils)


### Name: dissolve
### Title: Aggregate shapes in a SpatialPolygonsDataFrame
### Aliases: dissolve

### ** Examples

regions <- dissolve(SimpleCountries, field = "UN_region", sum_fields = "area")
plot(regions)
regions@data



