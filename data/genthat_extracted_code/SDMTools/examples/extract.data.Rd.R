library(SDMTools)


### Name: extract.data
### Title: Spatial Join of Points with Raster Grids
### Aliases: extract.data

### ** Examples

#create a simple object of class 'asc'
tasc = as.asc(matrix(1:50,nr=50,nc=50)); print(tasc)

#define some point locations
points = data.frame(x=runif(25,1,50),y=runif(25,1,50))

#extract the data
points$values = extract.data(points,tasc)

#show the data
print(points)



