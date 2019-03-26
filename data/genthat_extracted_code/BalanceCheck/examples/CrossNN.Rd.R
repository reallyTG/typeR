library(BalanceCheck)


### Name: CrossNN
### Title: Covariate balance checking through the nearest neighbor graph
### Aliases: CrossNN

### ** Examples

## A snippet of the smoking example in the reference paper.
## smoking.rda contains a 300 by 300 distance matrix, smokingDist.
## The indices of the treated subjects are 1:150. 
data(smoking)
CrossNN(smokingDist, 1:150)

## Uncomment the following line to get permutation p-value with 1,000 permutations.
# CrossNN(smokingDist, 1:150, perm=1000)



