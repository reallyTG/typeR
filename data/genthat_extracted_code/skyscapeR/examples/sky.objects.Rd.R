library(skyscapeR)


### Name: sky.objects
### Title: Creates a _skyscapeR.object_ for plotting of celestial objects
###   at given epoch
### Aliases: sky.objects

### ** Examples

## Not run: 
##D # Create a object with solar targets for epoch range 4000-2000 BC:
##D tt <- sky.objects('sun', c(-4000,-2000))
##D 
##D # Create an object with a few stars for same epoch:
##D tt <- sky.objects(c('Sirius', 'Betelgeuse', 'Antares'), c(-4000,-2000),
##D col=c('white', 'red', 'orange'))
##D 
##D # Create an object with solstices and a custom declination value:
##D tt <- sky.objects(c('dS','jS', -13), c(-4000,-2000))
## End(Not run)



