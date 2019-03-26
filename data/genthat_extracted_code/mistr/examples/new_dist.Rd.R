library(mistr)


### Name: new_dist
### Title: Creates New Distribution Object
### Aliases: new_dist

### ** Examples

## Not run: 
##D # using creator function
##D unifdist <- function(min = 0, max = 1) { 
##D    if (!is.numeric(min) || !is.numeric(max))   stop("Parameters must be a numeric")
##D    if (min >= max)   stop("min must be smaller than max.")
##D    new_dist(name = "Uniform", from = min, to = max)
##D }
##D 
##D #directly
##D U <- new_dist(name = "Uniform", from = 1, to = 6, 
##D               parameters =  list(min = 1, max = 6), class = "unifdist")
## End(Not run)



