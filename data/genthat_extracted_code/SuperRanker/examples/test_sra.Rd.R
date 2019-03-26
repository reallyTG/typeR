library(SuperRanker)


### Name: test_sra
### Title: Compute a Kolmogorov-Smirnoff-like test for Smooth quantiles of
###   a matrix of sequential rank agreements
### Aliases: test_sra

### ** Examples

# setting with 3 lists
mlist <- matrix(cbind(1:8,c(1,2,3,5,6,7,4,8),c(1,5,3,4,2,8,7,6)),ncol=3)
# compute sequential rank agreements
x=sra(mlist)
# compute rank agreement of 5 random permutations
null=random_list_sra(mlist,n=15)
# now extract point-wise quantiles according to confidence level
test_sra(x,null)
# compare to when we use the result of the first permutation run
test_sra(null[,1],null[,-1])




