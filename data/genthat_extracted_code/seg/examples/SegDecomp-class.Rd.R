library(seg)


### Name: SegDecomp-class
### Title: Class Decomp
### Aliases: SegDecomp-class coerce,SegDecomp,SpatialPoints-method
###   coerce,SegDecomp,SpatialPointsDataFrame-method
###   coerce,SegDecomp,SpatialPixelsDataFrame-method
###   coerce,SegDecomp,vector-method as.vector.SegDecomp-method
###   show,SegDecomp-method print.SegDecomp-method spplot,SegDecomp-method
### Keywords: classes

### ** Examples

# creates 100 regularly-spaced data points and 3 population groups
xy <- expand.grid(1:10, 1:10)
colnames(xy) <- c("x", "y")
pop <- matrix(runif(300), ncol = 3)
colnames(pop) <- LETTERS[1:3]

# randomly-generated index values
d <- runif(2, 0, 0.4)
d <- c(d, 0.9 - sum(d))

# constructs an object of class 'SegDecomp'
v <- SegDecomp(d = d, coords = as.matrix(xy), data = pop)
print(v)

# retrieves the index values
as.vector(v) # same as: as(v, "vector")

# displays the kernel estimates in the slot 'data'
spplot(v, col.regions = heat.colors(20))



