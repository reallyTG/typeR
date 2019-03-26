library(binGroup)


### Name: Inf.D3
### Title: Find the optimal testing configuration for informative
###   three-stage hierarchical testing
### Aliases: Inf.D3

### ** Examples

# Find the OTC for informative three-stage hierarchical 
#   testing over a range of group sizes.
# A vector of individual probabilities is generated using
#   the expected value of order statistics from a beta 
#   distribution with p = 0.05 and a heterogeneity level 
#   of alpha = 0.5. Depending on the specified probability, 
#   alpha level, and overall group size, simulation may 
#   be necessary in order to generate the vector of individual
#   probabilities. This is done using p.vec.func() and 
#   requires the user to set a seed in order to reproduce 
#   results.
# This example takes approximately 20 seconds to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
## Not run: 
##D set.seed(8318)
##D Inf.D3(p=0.05, Se=0.99, Sp=0.99, group.sz=3:30, 
##D obj.fn=c("ET", "MAR"), alpha=0.5)
## End(Not run)

# This example takes less than 1 second to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
set.seed(8318)
Inf.D3(p=0.05, Se=0.99, Sp=0.99, group.sz=10:15, 
obj.fn=c("ET", "MAR"), alpha=0.5)

# Find the OTC out of all possible testing configurations
#   for a specified group size and vector of individual 
#   probabilities.
# This example takes less than 1 second to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
set.seed(1216)
p.vec <- p.vec.func(p=0.10, alpha=2, grp.sz=12)
Inf.D3(p=p.vec, Se=0.99, Sp=0.99, group.sz=12,
obj.fn=c("ET", "MAR", "GR"), weights=matrix(data=c(1,1), 
nrow=1, ncol=2, byrow=TRUE), alpha=NA)



