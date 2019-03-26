library(DescTools)


### Name: CombPairs
### Title: Get All Pairs Out of One or Two Sets of Elements
### Aliases: CombPairs
### Keywords: manip

### ** Examples

CombPairs(letters[1:4])
CombPairs(x = letters[1:4], y = LETTERS[1:2])

# get all pairs of combinations between factors and numerics out of a data.frame
CombPairs(which(sapply(d.pizza, IsNumeric)), which(sapply(d.pizza, is.factor)))



