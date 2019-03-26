library(tcR)


### Name: permutDistTest
### Title: Monte Carlo permutation test for pairwise and one-vs-all-wise
###   within- and inter-group differences in a set of repertoires.
### Aliases: permutDistTest

### ** Examples

## Not run: 
##D data(twb)
##D mat <- repOverlap(twb)
##D permutDistTest(mat, list(tw1 = c('Subj.A', 'Subj.B'), tw2 = c('Subj.C', 'Subj.D')))
##D permutDistTest(mat, list(tw1 = c('Subj.A', 'Subj.B'), tw2 = c('Subj.C', 'Subj.D')), .fun = median)
## End(Not run)



