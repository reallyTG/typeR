library(geoknife)


### Name: cancel
### Title: cancel a geo-web processing request
### Aliases: cancel cancel,geojob-method cancel,missing-method
### Keywords: methods

### ** Examples

wd <- webdata('prism')
wg <- webgeom('state::New Hampshire')
wp <- webprocess()
gj <- geojob()
xml(gj) <- XML(wg, wd, wp)
url(gj) <- url(wp)
## Not run: 
##D gj <- start(gj)
##D gj <- cancel(gj)
## End(Not run)



