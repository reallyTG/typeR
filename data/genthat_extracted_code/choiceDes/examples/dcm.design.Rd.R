library(choiceDes)


### Name: dcm.design
### Title: Optimal fractional factorial design
### Aliases: dcm.design

### ** Examples

## Example 1:
## design from a single candidate set
levs1 <- c(3,3,5,4)
des <- dcm.design(levs1, 10, 6, 2)

## Example 2:
## combinatorial design from more than one candidate set
levs2 <- list(c(3,3), c(5,4))
des <- dcm.design(levs2, 10, 6, 2)



