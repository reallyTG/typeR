library(binGroup)


### Name: Inf.Dorf
### Title: Find the optimal testing configuration for informative two-stage
###   hierarchical (Dorfman) testing
### Aliases: Inf.Dorf

### ** Examples

# Find the OTC for informative two-stage hierarchical 
#   (Dorfman) testing.
# A vector of individual probabilities is generated using
#   the expected value of order statistics from a beta 
#   distribution with p = 0.01 and a heterogeneity level 
#   of alpha = 2. Depending on the specified probability, 
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
##D set.seed(9245)
##D Inf.Dorf(p=0.01, Se=0.95, Sp=0.95, group.sz=3:30, 
##D obj.fn=c("ET", "MAR"), alpha=2)
## End(Not run)

# This example takes less than 1 second to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
set.seed(9245)
Inf.Dorf(p=0.01, Se=0.95, Sp=0.95, group.sz=5:10, 
obj.fn=c("ET", "MAR"), alpha=2)

# Find the OTC for informative two-stage hierarchical 
#   (Dorfman) testing, for a specified block size.
# This example uses rbeta() to generate random probabilities 
#   and requires the user to set a seed in order to reproduce 
#   results.
# This example takes approximately 2.5 minutes to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
## Not run: 
##D set.seed(8791)
##D Inf.Dorf(p=p.vec.func(p=0.03, alpha=0.5, grp.sz=50), 
##D Se=0.90, Sp=0.90, group.sz=50, obj.fn=c("ET", "MAR", "GR"),
##D weights=matrix(data=c(1,1,10,10), nrow=2, ncol=2, byrow=TRUE),
##D alpha=NA)
## End(Not run)



