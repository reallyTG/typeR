library(PerMallows)


### Name: count.perms
### Title: Count permutations at a distance
### Aliases: count.perms

### ** Examples

count.perms(4,2,"kendall")
count.perms(4,2,"ulam")
count.perms(4,2,"hamming")
count.perms(4,2,"cayley")
# The number of derangements of length 6 is computed as follows
len <- 6
count.perms(perm.length = len, dist.value = len, dist.name = "h") 
# The number of permutations with one cycle is computed as follows
num.cycles <- 1 
count.perms(perm.length = len, dist.value = len - num.cycles, dist.name = "c") 



