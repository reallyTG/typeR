library(PLMIX)


### Name: freq_to_unit
### Title: Individual rankings/orderings from the frequency distribution
### Aliases: freq_to_unit

### ** Examples


library(gtools)

K <- 4
perm_matrix <- permutations(n=K,r=K)
freq_data <- cbind(perm_matrix,sample(1:factorial(K)))
freq_data

freq_to_unit(freq_distr=freq_data)




