library(geoknife)


### Name: XML
### Title: XML from set of objects
### Aliases: XML XML,webgeom-method XML,ANY,webdata,webprocess-method

### ** Examples

wd <- webdata('prism',times = as.POSIXct(c('2001-01-01','2002-02-05')))
wg <- webgeom('state::Wisconsin')
## Not run: 
##D XML(wg, wd, webprocess())
##D sg <- simplegeom(c(-89,45))
##D XML(sg, wd, webprocess())
## End(Not run)



