library(geoknife)


### Name: start
### Title: Submit a GDP web processing request
### Aliases: start start,geojob-method

### ** Examples

wd <- webdata('prism')
wg <- webgeom('state::New Hampshire')
wp <- webprocess()
gj <- geojob()
## Not run: 
##D xml(gj) <- XML(wg, wd, wp)
##D url(gj) <- url(wp)
##D gj <- start(gj)
## End(Not run)



