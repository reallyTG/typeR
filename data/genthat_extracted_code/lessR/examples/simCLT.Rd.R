library(lessR)


### Name: simCLT
### Title: Pedagogical Simulation for the Central Limit Theorem
### Aliases: simCLT
### Keywords: central limit theorem

### ** Examples

# plot of the standardized normal 
#  and corresponding sampling distribution with 10000 samples
#  each of size 2
simCLT(ns=1000, n=2)

# plot of the uniform dist from 0 to 4
#  and corresponding sampling distribution with 10000 samples
#  each of size 2
simCLT(ns=1000, n=2, p1=0, p2=4, type="uniform", bin.width=0.01)

# save the population and sample distributions to pdf files
simCLT(100, 10, pdf=TRUE)



