library(multipol)


### Name: ooom
### Title: One over one minus a multipol
### Aliases: ooom
### Keywords: array

### ** Examples

ooom(4,homog(3,1))


# How many 2x2 contingency tables of nonnegative integers with rowsums =
# c(2,2) and colsums = c(2,2) are there?  Good gives:

(
  ooom(2,lone(4,c(1,3))) *
  ooom(2,lone(4,c(1,4))) *
  ooom(2,lone(4,c(2,3))) *
  ooom(2,lone(4,c(2,4))) 
)[2,2,2,2]
  
# easier to use the aylmer package:

## Not run: 
##D library(aylmer)
##D no.of.boards(matrix(1,2,2))
## End(Not run)




