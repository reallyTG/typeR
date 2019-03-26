library(dvmisc)


### Name: which_max_im
### Title: Return (Row, Column) Index of (First) Maximum of an Integer
###   Matrix
### Aliases: which_max_im

### ** Examples

# which_max_im is typically much faster than 
# which(x == max(x), arr.ind = TRUE)
x <- matrix(rpois(100, lambda = 15), ncol = 10)
all(which(x == max(x), arr.ind = TRUE) == which_max_im(x))
benchmark(which(x == max(x), arr.ind = TRUE), which_max_im(x), 
          replications = 5000)




