library(dplyr)


### Name: funs
### Title: Create a list of functions calls.
### Aliases: funs

### ** Examples

funs(mean, "mean", mean(., na.rm = TRUE))

# Override default names
funs(m1 = mean, m2 = "mean", m3 = mean(., na.rm = TRUE))

# If you have function names in a vector, use funs_
fs <- c("min", "max")
funs_(fs)

# Not supported
## Not run: 
##D funs(function(x) mean(x, na.rm = TRUE))
##D funs(~mean(x, na.rm = TRUE))
## End(Not run)



