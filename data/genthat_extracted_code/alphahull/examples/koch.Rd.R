library(alphahull)


### Name: koch
### Title: Construct a Kock snowflake curve
### Aliases: koch
### Keywords: nonparametric

### ** Examples

## Not run: 
##D # The first four iterations of a Koch snowflake 
##D # with side length of the initial equilateral triangle equal to 3.
##D vertices <- koch(side = 2, niter = 4)
##D plot(vertices[, 1], vertices[, 2], type = "l", asp = TRUE, 
##D main = "Koch snowflake", xlab = "", ylab = "", col = 4)
##D polygon(vertices[, 1], vertices[, 2] , col = 4)
## End(Not run)



