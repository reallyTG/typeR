library(updog)


### Name: get_q_array
### Title: Return the probabilities of an offspring's genotype given its
###   parental genotypes for all possible combinations of parental and
###   offspring genotypes. This is for species with polysomal inheritance
###   and bivalent, non-preferential pairing.
### Aliases: get_q_array

### ** Examples

qarray <- get_q_array(6)
apply(qarray, c(1, 2), sum) ## should all be 1's.




