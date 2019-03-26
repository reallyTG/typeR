library(phenex)


### Name: values
### Title: Raw Value Accessor
### Aliases: values

### ** Examples

	# load data 
	data(avhrr)

	# create NDVI object
	ndvi <- new("NDVI", values=avhrr.ndvi/10000, year=as.integer(1995))

	#extract raw values
	rawValues <- values(ndvi)



