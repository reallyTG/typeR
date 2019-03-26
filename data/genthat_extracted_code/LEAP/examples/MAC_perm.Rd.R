library(LEAP)


### Name: MAC_perm
### Title: Function to perform a permutation analysis to determine a cutoff
###   for significant MAC values.
### Aliases: MAC_perm num_perms perm_file_name FDR_cutoffs
### Keywords: ~kwd1 ~kwd2

### ** Examples


x <- matrix(rnorm(6),2,3)
cor <- cor(x)
y <- MAC_perm(x, cor)

## Not run: MAC_perm(data=example_data, MACs_observ=MAC_example)



