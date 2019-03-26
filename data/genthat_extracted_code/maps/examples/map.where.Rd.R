library(maps)


### Name: map.where
### Title: Locate points on a map
### Aliases: map.where
### Keywords: iplot

### ** Examples

# NYC
map.where("state", -73.8, 41)
# Auckland
map.where("nz", 174.6, -36.92)
# find both in the world
map.where(x = c(174.6, -73.8), y = c(-36.92, 41))
# with a map object:
m = map("state", "new york", fill = TRUE, plot = FALSE)
map.where(m, -73.8, 41)



