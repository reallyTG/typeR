library(plink)


### Name: as.poly.mod
### Title: poly.mod objects
### Aliases: as.poly.mod
### Keywords: misc

### ** Examples

# Ten dichotomous items
as.poly.mod(10)

# The first ten items in the set of associated (not present here) item 
# parameters are dichotomous and the last five were estimated using the 
# generalized partial credit model
as.poly.mod(15, c("drm", "gpcm"), list(1:10,11:15) )

# Ten multidimensional graded response model items
# Note: This same specification would be used for a unidimensional
# graded response model
as.poly.mod(10, "grm")



