library(maps)


### Name: legacy_world
### Title: Legacy low resolution World Map. DEPRECATED!
### Aliases: legacy_world legacy_worldMapEnv legacy_world2
###   legacy_world2MapEnv
### Keywords: datasets

### ** Examples

## DEPRECATED:
# map('legacy_world', fill = TRUE, col = 1:10)
## Use mapdata::worldLores instead:
if (requireNamespace("mapdata", quietly=TRUE) && packageVersion("mapdata") >= "2.3") {
  map("mapdata::worldLores", fill = TRUE, col = 1:10)
}



