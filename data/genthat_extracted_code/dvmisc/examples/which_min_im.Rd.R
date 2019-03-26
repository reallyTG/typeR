library(dvmisc)


### Name: which_min_im
### Title: Return (Row, Column) Index of (First) Minimum of an Integer
###   Matrix
### Aliases: which_min_im

### ** Examples

# which_min_im is typically much faster than 
# which(x == min(x), arr.ind = TRUE)
x <- matrix(rpois(100, lambda = 10), ncol = 10)
all(which(x == min(x), arr.ind = TRUE) == which_min_im(x))
benchmark(which(x == min(x), arr.ind = TRUE), which_min_im(x),
          replications = 5000)




