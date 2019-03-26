library(SDMTools)


### Name: put.data
### Title: Spatial Join of Points with Raster Grids - replace data
### Aliases: put.data

### ** Examples

#create a simple object of class 'asc'
tasc = as.asc(matrix(1:50,nr=50,nc=50)); print(tasc)
## Not run: image(tasc)

#define some point locations
points = data.frame(x=runif(25,1,50),y=runif(25,1,50),z=50)

#put the new data
tasc = put.data(points,tasc)

#show the data
## Not run: image(tasc)



