library(binGroup)


### Name: OTC
### Title: Find the optimal testing configuration
### Aliases: OTC

### ** Examples

# Find the OTC for non-informative
#   two-stage hierarchical (Dorfman) testing
# This example takes less than 1 second to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
OTC(algorithm="D2", p=0.05, Se=0.99, Sp=0.99, group.sz=2:100,
obj.fn=c("ET", "MAR"))

# Find the OTC for informative
#   two-stage hierarchical (Dorfman) testing, implemented
#   via the pool-specific optimal Dorfman (PSOD) method
#   described in McMahan et al. (2012a), where the greedy
#   algorithm proposed for PSOD is replaced by considering
#   all possible testing configurations.
# A vector of individual probabilities is generated using
#   the expected value of order statistics from a beta 
#   distribution with p = 0.01 and a heterogeneity level 
#   of alpha = 0.5. Depending on the specified probability, 
#   alpha level, and overall group size, simulation may 
#   be necessary in order to generate the vector of individual
#   probabilities. This is done using p.vec.func() and 
#   requires the user to set a seed in order to reproduce 
#   results.
# This example takes approximately 2.5 minutes to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
## Not run: 
##D set.seed(52613)
##D OTC(algorithm="ID2", p=0.01, Se=0.95, Sp=0.95, group.sz=50,
##D obj.fn=c("ET", "MAR", "GR"),
##D weights=matrix(data=c(1, 1, 10, 10, 0.5, 0.5), 
##D nrow=3, ncol=2, byrow=TRUE), alpha=0.5)
## End(Not run)

# Find the OTC over all possible
#   testing configurations for a specified group size for
#   non-informative three-stage hierarchical testing
# This example takes approximately 1 second to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
OTC(algorithm="D3", p=0.001, Se=0.95, Sp=0.95, group.sz=18,
obj.fn=c("ET", "MAR", "GR"),
weights=matrix(data=c(1, 1), nrow=1, ncol=2, byrow=TRUE))

# Find the OTC for non-informative
#   three-stage hierarchical testing
# This example takes approximately 20 seconds to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
## Not run: 
##D OTC(algorithm="D3", p=0.06, Se=0.90, Sp=0.90, 
##D group.sz=3:30, obj.fn=c("ET", "MAR", "GR"),
##D weights=matrix(data=c(1, 1, 10, 10, 100, 100), 
##D nrow=3, ncol=2, byrow=TRUE))
## End(Not run)

# Find the OTC over all possible configurations 
#   for a specified group size, given a 
#   heterogeneous vector of probabilities.
# This example takes less than 1 second to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
OTC(algorithm="ID3", probabilities=c(0.012, 0.014, 0.011, 
0.012, 0.010, 0.015), Se=0.99, Sp=0.99, group.sz=6, 
obj.fn=c("ET","MAR","GR"), weights=matrix(data=c(1, 1), 
nrow=1, ncol=2, byrow=TRUE), alpha=0.5)

# Calculate the operating characteristics for a specified array size
#   for non-informative array testing without master pooling
# This example takes less than 1 second to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
OTC(algorithm="A2", p=0.005, Se=0.95, Sp=0.95, group.sz=8, 
obj.fn=c("ET", "MAR"))

# Find the OTC for informative array testing without 
#   master pooling
# A vector of individual probabilities is generated using
#   the expected value of order statistics from a beta 
#   distribution with p = 0.03 and a heterogeneity level 
#   of alpha = 2. The probabilities are then arranged in 
#   a matrix using the gradient method described in 
#   McMahan et al. (2012b). Depending on the specified 
#   probability, alpha level, and overall group size, 
#   simulation may be necessary in order to generate the 
#   vector of individual probabilities. This is done using 
#   p.vec.func() and requires the user to set a 
#   seed in order to reproduce results.
# This example takes approximately 30 seconds to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
## Not run: 
##D set.seed(1002)
##D OTC(algorithm="IA2", p=0.03, Se=0.95, Sp=0.95, 
##D group.sz=3:20, obj.fn=c("ET", "MAR", "GR"),
##D weights=matrix(data=c(1, 1, 10, 10, 100, 100), 
##D nrow=3, ncol=2, byrow=TRUE), alpha=2)
## End(Not run)

# Find the OTC for non-informative array testing 
#   with master pooling
# This example takes approximately 20 seconds to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
## Not run: 
##D OTC(algorithm="A2M", p=0.02, Se=0.90, Sp=0.90, 
##D group.sz=3:20, obj.fn=c("ET", "MAR", "GR"),
##D weights=matrix(data=c(1, 1, 10, 10, 0.5, 0.5, 2, 2, 
##D 100, 100, 10, 100), nrow=6, ncol=2, byrow=TRUE))
## End(Not run)



