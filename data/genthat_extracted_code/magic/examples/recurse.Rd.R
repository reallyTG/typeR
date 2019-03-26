library(magic)


### Name: recurse
### Title: Recursively apply a permutation
### Aliases: recurse
### Keywords: array

### ** Examples


n <- 15
noquote(recurse(start=letters[1:n],perm=shift(1:n),i=0))
noquote(recurse(start=letters[1:n],perm=shift(1:n),i=1))
noquote(recurse(start=letters[1:n],perm=shift(1:n),i=2))

noquote(recurse(start=letters[1:n],perm=sample(n),i=1))
noquote(recurse(start=letters[1:n],perm=sample(n),i=2))




