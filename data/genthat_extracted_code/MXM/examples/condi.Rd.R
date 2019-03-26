library(MXM)


### Name: Conditional independence tests with and without permutation p-value
### Title: Conditional independence test for continuous class variables
###   with and without permutation based p-value
### Aliases: condi dist.condi cat.ci
### Keywords: Fisher's test conditional independence test permutation based
###   p-value

### ** Examples

#simulate a dataset with continuous data
dataset <- matrix(runif(500 * 5, 1, 100), ncol = 5 )
testIndFisher(dataset[, 1], dataset[, -1], xIndex = 1, csIndex = 2)
condi(ind1 = 1, ind2 = 2, cs = 3, dataset, R = 1)
condi(ind1 = 1, ind2 = 2, cs = 3, dataset, R = 999)
dist.condi(ind1 = 1, ind2 = 2, 0, dataset)
dist.condi(ind1 = 1, ind2 = 2, cs = 3, dataset, R = 99)



