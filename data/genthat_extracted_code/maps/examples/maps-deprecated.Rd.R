library(maps)


### Name: maps-deprecated
### Title: DEPRECATED
### Aliases: maps-deprecated Deprecated

### ** Examples

## DEPRECATED:
# map('legacy_world', fill = TRUE, col = 1:10)
## Use mapdata::worldLores instead:
#Not run
if (requireNamespace("mapdata", quietly=TRUE) && packageVersion("mapdata") >= "2.3.0") {
  map("mapdata::worldLores", fill = TRUE, col = 1:10)
}



