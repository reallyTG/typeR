library(seg)


### Name: SegDecomp
### Title: Create an Object of Class SegDecomp
### Aliases: SegDecomp

### ** Examples

# creates a random data set with 50 data points and 3 population groups
xy <- matrix(runif(100), ncol = 2)
colnames(xy) <- c("x", "y")
pop <- matrix(runif(150), ncol = 3)
colnames(pop) <- LETTERS[1:3]

# constructs an object of class 'SegDecomp'
v <- SegDecomp(d = numeric(3), coords = xy, data = pop)
is(v)



