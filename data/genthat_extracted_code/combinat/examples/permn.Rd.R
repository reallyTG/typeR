library(combinat)


### Name: permn
### Title: Generates all permutations of the elements of x
### Aliases: permn
### Keywords: models

### ** Examples

    # Convert output to a matrix of dim c(6, 720)
     t(array(unlist(permn(6)), dim = c(6, gamma(7))))
       # A check that every element occurs the same number of times in each
       # position
       apply(t(array(unlist(permn(6)), dim = c(6, gamma(7)))), 2, tabulate,
               nbins = 6)

       # Apply, on the fly, the diff function to every permutation
       t(array(unlist(permn(6, diff)), dim = c(5, gamma(7))))



