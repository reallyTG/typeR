library(phenex)


### Name: detectSeasons
### Title: Season Detection
### Aliases: detectSeasons

### ** Examples

	# load data
	data(avhrr)

	# generate ndvi object
	ndvi <- new("NDVI", values=rep(avhrr.ndvi/10000,5), year=NA)

	# extract seasons
	ndvi <- detectSeasons(ndvi)
	seasons(ndvi)



