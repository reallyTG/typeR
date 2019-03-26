library(seg)


### Name: SegSpatial
### Title: Create an Object of Class SegSpatial
### Aliases: SegSpatial

### ** Examples

# creates a random data set with 50 data points and 3 population groups
xy <- matrix(runif(100), ncol = 2)
colnames(xy) <- c("x", "y")
pop <- matrix(runif(150), ncol = 3)
colnames(pop) <- LETTERS[1:3]

# constructs an object of class 'SegSpatial'
v <- SegSpatial(d = numeric(), r = numeric(), h = numeric(), 
                p = matrix(0, 0, 0), coords = xy, data = pop, env = pop)
is(v)



