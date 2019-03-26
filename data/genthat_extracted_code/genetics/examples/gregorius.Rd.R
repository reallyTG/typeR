library(genetics)


### Name: gregorius
### Title: Probability of Observing All Alleles with a Given Frequency in a
###   Sample of a Specified Size.
### Aliases: gregorius
### Keywords: misc

### ** Examples


# Compute the probability of missing an allele with frequency 0.15 when
# 20 genotypes are sampled:
gregorius(freq=0.15, N=20)

# Determine what sample size is required to observe all alleles with true
# frequency 0.15 with probability 0.95
gregorius(freq=0.15, missprob=1-0.95)





