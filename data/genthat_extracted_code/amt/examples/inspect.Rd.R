library(amt)


### Name: inspect
### Title: Inspect a track
### Aliases: inspect inspect.track_xy

### ** Examples

data(sh)
x <- track(x = sh$x, y = sh$y, crs = sp::CRS("+init=epsg:31467"))

## Not run: 
##D inspect(x)
##D inspect(x, cluster = FALSE)
##D inspect(x, popup = 1:nrow(x), cluster = FALSE)
## End(Not run)



