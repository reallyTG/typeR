library(randomizr)


### Name: complete_rs
### Title: Complete Random Sampling
### Aliases: complete_rs

### ** Examples

S <- complete_rs(N = 100)
table(S)

S <- complete_rs(N = 100, n = 50)
table(S)

S <- complete_rs(N = 100, prob = .111)
table(S)

# If N = n, sample with 100% probability...
complete_rs(N=2, n=2)

# Up through randomizr 0.12.0, 
# This behavior has been deprecated
complete_rs(N=1, n=1) # sampled with 50% probability





