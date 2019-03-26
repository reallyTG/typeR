library(seg)


### Name: SegLocal
### Title: Create an Object of Class SegLocal
### Aliases: SegLocal

### ** Examples

# creates a random data set with 50 data points and 3 population groups
xy <- matrix(runif(100), ncol = 2)
colnames(xy) <- c("x", "y")
pop <- matrix(runif(150), ncol = 3)
colnames(pop) <- LETTERS[1:3]

# constructs an object of class 'SegLocal'
v <- SegLocal(coords = xy, data = pop, env = pop)
is(v)



