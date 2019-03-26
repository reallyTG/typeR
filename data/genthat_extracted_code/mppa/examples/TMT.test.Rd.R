library(mppa)


### Name: TMT.test
### Title: A method for combining p-values based on a changepoint model
### Aliases: TMT.test

### ** Examples

## This should be uniformly distributed
TMT.test(runif(10))$p
## Whenever no p-values fall inside [0,maxtau] the returned p-value is one
replicate(20,TMT.test(runif(10), maxtau=.1)$p)
##Use maxtau to gain extra detection power if only interested in a
##subset of very low p-values, e.g.
TMT.test(c(.04, .5))$p
##is larger than
TMT.test(c(.04, .5), maxtau=0.05)$p



