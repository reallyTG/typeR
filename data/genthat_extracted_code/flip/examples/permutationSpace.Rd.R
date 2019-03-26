library(flip)


### Name: permutationSpace
### Title: These functions handle the orbit of permutation/rotation tests
###   (i.e. permutation/rotation space).
### Aliases: permutationSpace make.permSpace make.signSpace allpermutations
###   npermutations t2p rom romFast
### Keywords: manip

### ** Examples


#10 random elements of the orbit of a one-sample test
make.signSpace(5, 10)

#All elements of the orbit of a one-sample test (the size of the space is 2^5 < 1000)
make.signSpace(5, 1000)

## Not run: 
##D #A random rotation matrix of size 3
##D (r=rom(3))
##D #verify that it is orthogonal:
##D r%*%t(r)
## End(Not run)




