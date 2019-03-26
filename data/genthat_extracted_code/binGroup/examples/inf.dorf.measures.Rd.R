library(binGroup)


### Name: inf.dorf.measures
### Title: Operating characteristics for informative two-stage hierarchical
###   (Dorfman) testing
### Aliases: inf.dorf.measures

### ** Examples

# Calculate the operating characteristics for 
#   informative two-stage hierarchical (Dorfman) testing
#   with an overall disease prevalence of E(p(i)) = 0.01,
#   where a block size of 50 is split into initial pools
#   of 18, 13, 11, and 8 individuals.
# This example takes less than 1 second to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
set.seed(8791)
inf.dorf.measures(prob=beta.dist(p=0.01, alpha=2, 
grp.sz=50, simul=TRUE), se=0.95, sp=0.95, N=50, 
pool.sizes=c(18, 13, 11, 8))



