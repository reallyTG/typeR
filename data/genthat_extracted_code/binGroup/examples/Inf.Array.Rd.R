library(binGroup)


### Name: Inf.Array
### Title: Find the optimal testing configuration for informative array
###   testing without master pooling
### Aliases: Inf.Array

### ** Examples

# Find the OTC for informative array testing without 
#   master pooling over a range of group (row/column) sizes.
# A vector of individual probabilities is generated using
#   the expected value of order statistics from a beta 
#   distribution with p = 0.03 and a heterogeneity level 
#   of alpha = 2. Depending on the specified probability, 
#   alpha level, and overall group size, simulation may 
#   be necessary in order to generate the vector of individual
#   probabilities. This is done using p.vec.func() and 
#   requires the user to set a seed in order to reproduce 
#   results.
# This examples takes approximately 30 seconds to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
## Not run: 
##D set.seed(1002)
##D Inf.Array(p=0.03, Se=0.99, Sp=0.99, group.sz=3:20, 
##D obj.fn=c("ET", "MAR"), alpha=2)
## End(Not run)

# This example takes less than 1 second to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
set.seed(1002)
Inf.Array(p=0.03, Se=0.99, Sp=0.99, group.sz=3:5, 
obj.fn=c("ET", "MAR"), alpha=2)

# Find the OTC for a specified group (row/column) size 
#   for informative array testing without master pooling.
# This example takes less than 1 second to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
set.seed(14849)
Inf.Array(p=p.vec.func(p=0.05, alpha=0.5, grp.sz=100), 
Se=0.95, Sp=0.95, group.sz=10, obj.fn=c("ET", "MAR", "GR"),
weights=matrix(data=c(1,1,10,10), nrow=2, ncol=2, byrow=TRUE),
alpha=NA)



