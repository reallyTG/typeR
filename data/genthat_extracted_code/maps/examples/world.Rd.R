library(maps)


### Name: world
### Title: Low (mid) resolution World Map
### Aliases: world worldMapEnv
### Keywords: datasets

### ** Examples

# notice how some polygons extend beyond the [-180,180] interval:
map('world', fill = TRUE, col = 1:10)
# if you wrap at [-180,180], you also can get a clean closure of Antarctica
map('world', fill = TRUE, col = 1:10, wrap=c(-180,180) )



