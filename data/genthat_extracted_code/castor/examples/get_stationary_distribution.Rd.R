library(castor)


### Name: get_stationary_distribution
### Title: Stationary distribution of Markov transition matrix.
### Aliases: get_stationary_distribution
### Keywords: stationary distribution Mk model

### ** Examples

# generate a random 5x5 Markov transition matrix
Q = get_random_mk_transition_matrix(Nstates=5, rate_model="ARD")

# calculate stationary probability distribution
p = get_stationary_distribution(Q)
print(p)

# test correctness (p*Q should be 0, apart from rounding errors)
cat(sprintf("max(abs(p*Q)) = %g\n",max(abs(p %*% Q))))



