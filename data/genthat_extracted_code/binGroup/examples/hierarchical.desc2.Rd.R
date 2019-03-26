library(binGroup)


### Name: hierarchical.desc2
### Title: Operating characteristics for hierarchical group testing
### Aliases: hierarchical.desc2

### ** Examples

# Calculate the operating characteristics for 
#   non-informative two-stage hierarchical testing
#   with an overall disease prevalence of p = 0.015
#   and an initial group size of 12.
# This example takes less than 1 second to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
p.vec <- rep(x=0.015, times=12)
hierarchical.desc2(p=p.vec, I2=NULL, I3=NULL, se=0.95, 
sp=0.95, order.p=FALSE)

# Calculate the operating characteristics for 
#   non-informative three-stage hierarchical testing
#   with an overall disease prevalence of p = 0.04, 
#   where an initial group of 20 individuals is 
#   split into equally sized subgroups of 5 each.
# This example takes less than 1 second to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
p.vec <- rep(x=0.04, times=20)
hierarchical.desc2(p=p.vec, I2=rep(x=5, times=4),
I3=NULL, se=0.99, sp=0.99, order.p=FALSE)

# Calculate the operating characteristics for 
#   informative three-stage hierarchical testing
#   where an initial group of 10 individuals is 
#   split into subsequent groups of 5, 4, and 1 
#   individual.
# A vector of individual probabilities is generated using
#   the expected value of order statistics from a beta 
#   distribution with p = 0.02 and a heterogeneity level 
#   of alpha = 0.5. Depending on the specified probability, 
#   alpha level, and overall group size, simulation may 
#   be necessary in order to generate the vector of individual
#   probabilities. This is done using p.vec.func() and 
#   requires the user to set a seed in order to reproduce 
#   results.
# This example takes less than 1 second to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
set.seed(1002)
p.vec <- p.vec.func(p=0.02, alpha=0.5, grp.sz=10)
hierarchical.desc2(p=p.vec, I2=c(5,4,1), I3=NULL,
se=0.90, sp=0.90, order.p=TRUE)



