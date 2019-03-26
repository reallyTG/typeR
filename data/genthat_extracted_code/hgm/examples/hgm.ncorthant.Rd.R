library(hgm)


### Name: hgm.ncorthant
### Title: The function hgm.ncorthant evaluates the orthant probability.
### Aliases: hgm.ncorthant
### Keywords: Normalization constant Holonomic gradient method HGM Orthant
###   probability

### ** Examples

## =====================================================
## Example 1. Computing the orthant probability
## =====================================================
x <- matrix(c(15,26,23,19,
	      26,47,46,35,
	      23,46,65,38,
	      19,35,38,33), nrow =4) 
y <- c(1,2,3,4)
hgm.ncorthant(x,y)



