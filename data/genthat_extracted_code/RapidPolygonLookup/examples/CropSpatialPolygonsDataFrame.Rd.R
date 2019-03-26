library(RapidPolygonLookup)


### Name: CropSpatialPolygonsDataFrame
### Title: Crop polygons to bounding box and adds polygon centers
### Aliases: CropSpatialPolygonsDataFrame

### ** Examples

# San Francisco:
data(california.tract10, envir = environment())
sf.polys <- CropSpatialPolygonsDataFrame(x= california.tract10, 
                                       bb= data.frame(X=c(-122.5132, -122.37), 
                                                      Y= c(37.70760, 37.81849)))




