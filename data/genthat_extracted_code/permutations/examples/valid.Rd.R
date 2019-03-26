library(permutations)


### Name: valid
### Title: Functions to validate permutations
### Aliases: validity singleword_valid cyclist_valid
### Keywords: symbmath

### ** Examples


singleword_valid(sample(1:9))

## Not run: 
##D singleword_valid(c(5,6,3,9,7,8,2,1))   # returns an error (no '4')
##D singleword_valid(c(5,6,3,4,9,7,8,2,1)) # returns an error (not integer)
## End(Not run)

cyclist_valid(list(c(1,8,2),c(3,6))) # should be TRUE
singleword_valid(c(5L,6L,3L,4L,9L,7L,8L,2L,1L)) # should be TRUE

## Not run: 
##D cyclist_valid(list(c(1,8,2),c(8,6))) # returns an error ('8' is repeated)
## End(Not run)



