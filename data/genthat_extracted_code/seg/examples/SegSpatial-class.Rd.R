library(seg)


### Name: SegSpatial-class
### Title: Class SegSpatial
### Aliases: SegSpatial-class coerce,SegSpatial,SpatialPoints-method
###   coerce,SegSpatial,SpatialPointsDataFrame-method
###   coerce,SegSpatial,SpatialPixelsDataFrame-method
###   coerce,SegSpatial,list-method as.list.SegSpatial-method
###   show,SegSpatial-method print.SegSpatial-method
###   spplot,SegSpatial-method
### Keywords: classes

### ** Examples

# creates 100 regularly-spaced data points and 3 population groups
xy <- expand.grid(1:10, 1:10)
colnames(xy) <- c("x", "y")
pop <- matrix(runif(300), ncol = 3)
env <- matrix(runif(300), ncol = 3)
colnames(pop) <- LETTERS[1:3]
colnames(env) <- LETTERS[4:6]

# constructs an object of class 'SegSpatial'
v <- SegSpatial(d = numeric(), r = numeric(), h = numeric(), 
                p = matrix(0, 0, 0), 
                coords = as.matrix(xy), data = pop, env = env)
print(v)

# changes the spatial dissimilarity index value
slot(v, "d") <- runif(1)

# retrieves the index values
as.list(v)

# displays the values in the slot 'data'
spplot(v, col.regions = heat.colors(20))

# displays the values in the slot 'env'
w <- as(v, "SegLocal")
spplot(w, col.regions = heat.colors(20))



