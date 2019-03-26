library(ENiRG)


### Name: apis.enirg
### Title: List of an object 'enirg'.
### Aliases: apis.enirg
### Keywords: datasets

### ** Examples

require(raster)

# loading map of Iberian Peninsula
mask.file <- paste(system.file(package = "ENiRG"),
                   "/ext/", "mask.asc", sep="")
plot(raster(mask.file), col="brown", legend=FALSE, xlab = "longitude",
     ylab = "latitude")

data(apis.enirg)
points(apis.enirg$presences[, 1:2],
       cex=apis.enirg$presences[, 3] / 30, pch=19)



