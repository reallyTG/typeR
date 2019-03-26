library(freegroup)


### Name: reduce
### Title: Reduction of a word to reduced form
### Aliases: reduce remove_zero_powers is_reduced consolidate is_proper

### ** Examples


## create a matrix:
M <- rbind(c(1,2,3,3,2,3,2,1),c(1,2,3,-3,5,0,7,0))

## call the print method (note non-reduced form):
as.character_free(M)

## show the effect of reduce():
as.character_free(reduce(M))

## free() calls reduce() automatically:
free(M)



