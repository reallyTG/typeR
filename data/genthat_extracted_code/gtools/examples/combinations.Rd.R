library(gtools)


### Name: combinations
### Title: Enumerate the Combinations or Permutations of the Elements of a
###   Vector
### Aliases: combinations permutations
### Keywords: manip

### ** Examples

combinations(3,2,letters[1:3])
combinations(3,2,letters[1:3],repeats=TRUE)

permutations(3,2,letters[1:3])
permutations(3,2,letters[1:3],repeats=TRUE)

# To use large 'n', you need to change the default recusion limit
options(expressions=1e5)
cmat <- combinations(300,2)
dim(cmat) # 44850 by 2



