
## test script for fam.recrisk

## definition of arguments:

## s  vector of sizes of families
## a  vector of number of affected members per family
## k  number of affecteds to condition on, the ascertainment criterion (e.g., at least k affecteds)

## for recrisk.ration, the argument fit is the list object returned from fam.recrisk

## example usage of functions

require(fam.recrisk)

s <- c(4,  8,  6,  6,  10, 8,  7,  8,  5,  6,  10, 4,  4,  8,  6,  8,  4,  5,  9, 
       9,  5,  4,  4,  7,  3,  3,  9,  5,  3,  3,  4,  6,  8,  3,  5,  8,  6,  8, 9,  3)

a <- c(3, 4, 2, 5, 4, 5, 3, 4, 3, 3, 8, 2, 0, 3, 4, 5, 2, 3, 4, 2, 1, 1,
       1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 2, 0, 0, 1, 0, 2, 3, 0)

set.seed(10000)
fam.recrisk(s,a,1)

recrisk.single.ascertain(s,a)

recrisk.mixture(s,a,k=1)

fit <- fam.recrisk(s,a,1)

recrisk.ratio(fit)

