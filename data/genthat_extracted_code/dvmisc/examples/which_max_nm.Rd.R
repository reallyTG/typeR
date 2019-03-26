library(dvmisc)


### Name: which_max_nm
### Title: Return (Row, Column) Index of (First) Maximum of a Numeric
###   Matrix
### Aliases: which_max_nm

### ** Examples

# which_max_nm is typically much faster than 
# which(x == max(x), arr.ind = TRUE)
x <- matrix(rnorm(100), ncol = 10)
all(which(x == max(x), arr.ind = TRUE) == which_max_nm(x))
benchmark(which(x == max(x), arr.ind = TRUE), which_max_nm(x),
          replications = 5000)




