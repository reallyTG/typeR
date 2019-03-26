library(binGroup)


### Name: beta.dist
### Title: Expected value of order statistics from a beta distribution
### Aliases: beta.dist

### ** Examples

# This example takes less than 1 second to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
set.seed(8791)
beta.dist(p=0.05, alpha=1, grp.sz=30)

# This example takes less than 1 second to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
set.seed(1002)
beta.dist(p=0.02, alpha=2, grp.sz=50, simul=TRUE)

# This example takes less than 1 second to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
set.seed(5732)
beta.dist(alpha=2, beta=5, grp.sz=15, plot=TRUE)



