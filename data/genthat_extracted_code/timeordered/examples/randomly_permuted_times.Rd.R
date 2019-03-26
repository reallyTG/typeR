library(timeordered)


### Name: randomly_permuted_times
### Title: Randomize temporal networks
### Aliases: randomly_permuted_times vertex_randomization
###   contact_randomization time_reversal randomly_permuted_times
###   random_times randomized_contacts edge_randomization
###   total_randomization randomized_edges
### Keywords: ~kwd1 ~kwd2

### ** Examples

# load a temporal network
require(timeordered)
data(ants)

# randomly permute contact start timestamps while preserving contact duration
r1 <- randomly_permuted_times(ants)

# randomly permute vertices between contacts and assign a random start 
# timestamp to each contact while preserving contact duration
r2 <- contact_randomization(ants)
r2 <- random_times(r1)



