library(SuperRanker)


### Name: random_list_sra
### Title: Simulate sequential rank agreement for randomized unrelated
###   lists
### Aliases: random_list_sra

### ** Examples

# setting with 3 lists
mlist <- matrix(cbind(1:8,c(1,2,3,5,6,7,4,8),c(1,5,3,4,2,8,7,6)),ncol=3)
# compute sequential rank agreement of lists
sra(mlist)
# compute sequential rank agreement of 5 random permutations
random_list_sra(mlist, n=5)




