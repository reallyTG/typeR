library(lawn)


### Name: lawn_random
### Title: Generate random data
### Aliases: lawn_random

### ** Examples

## set of points
lawn_random(n = 2)
lawn_random(n = 10)
## set of polygons
lawn_random('polygons', 2)
lawn_random('polygons', 10)
# with options
lawn_random(bbox = c(-70, 40, -60, 60))
lawn_random(num_vertices = 5)



