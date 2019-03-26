library(ionr)


### Name: optimal_p
### Title: Find an optimal p-value for SONE
### Aliases: optimal_p

### ** Examples

set.seed(466)
n_sim=100
ptm <- proc.time()
a=optimal_p(sizes=750, n_sim=n_sim, n_indicators=8, cor_to_outcome=0.25)
stp=proc.time() - ptm
print(paste("Currently elapsed:",round(stp[3],1)))
print(paste("Time estimate for n_sim=5000:",round(stp[3]*5000/n_sim,1)))




