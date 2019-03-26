library(lawn)


### Name: lawn_coordall
### Title: Get all coordinates from any GeoJSON object, returning an array
###   of coordinate arrays.
### Aliases: lawn_coordall

### ** Examples

lawn_point(c(-74.5, 40)) %>% lawn_coordall()

rings <- list(list(
   c(-2.275543, 53.464547),
   c(-2.275543, 53.489271),
   c(-2.215118, 53.489271),
   c(-2.215118, 53.464547),
   c(-2.275543, 53.464547)
))
lawn_polygon(rings) %>% lawn_coordall()



