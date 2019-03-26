library(multicool)


### Name: allPerm
### Title: Generate and return all permutations of a multiset
### Aliases: allPerm
### Keywords: permutations

### ** Examples

## a small numeric example with 6 permuations
x = c(1,1,2,2)
m = initMC(x)
allPerm(m)

## a large character example - 60 possibilities
x = rep(letters[1:3], 3:1)
multinom(x) ## calculate the number of permutations
m = initMC(x)
allPerm(m)



