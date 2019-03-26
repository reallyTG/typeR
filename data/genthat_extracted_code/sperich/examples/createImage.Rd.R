library(sperich)


### Name: createImage
### Title: Image Creation
### Aliases: createImage

### ** Examples

##load data
data(dataset.all.species)
data(dataset.landwater)

##create grid parameters
dimension <- getDimension(dataset.all.species, resolution=1)
shift <- getShift(dataset.all.species)

##create landwatermask
landwatermask.nocoast <- createLandwatermask(dataset.landwater, 
						dimension, shift, resolution=1)

##estimate species richness
species.richness.weighted <- species.richness(dataset.all.species, 
	landwatermask.nocoast, distances=1:5, weight=0.5, dimension, 
	shift, resolution=1, upperbound=3000, all.species=1:2)

##create image
## Not run: 
##D image.success <- createImage(species.richness.weighted, landwatermask.nocoast, 
##D 	    image.title="Test", directory=getwd(), filename="species.richness.test01.png", 
##D 	    shift, parts=10, resolution=1)
##D print(image.success)
## End(Not run)



