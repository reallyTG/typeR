library(SuperRanker)


### Name: smooth_sra
### Title: Smooth quantiles of a matrix of sequential ranked agreements.
### Aliases: smooth_sra

### ** Examples

# setting with 3 lists
mlist <- matrix(cbind(1:8,c(1,2,3,5,6,7,4,8),c(1,5,3,4,2,8,7,6)),ncol=3)
# compute rank agreement of 5 random permutations
null=random_list_sra(mlist,n=15)
# now extract point-wise quantiles according to confidence level
smooth_sra(null)



