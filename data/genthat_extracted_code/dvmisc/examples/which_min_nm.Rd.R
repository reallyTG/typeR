library(dvmisc)


### Name: which_min_nm
### Title: Return (Row, Column) Index of (First) Minimum of a Numeric
###   Matrix
### Aliases: which_min_nm

### ** Examples

# which_min_nm is typically much faster than 
# which(x == min(x), arr.ind = TRUE)
x <- matrix(rnorm(100), ncol = 10)
all(which(x == min(x), arr.ind = TRUE) == which_min_nm(x))
benchmark(which(x == min(x), arr.ind = TRUE), which_min_nm(x), 
          replications = 5000)




