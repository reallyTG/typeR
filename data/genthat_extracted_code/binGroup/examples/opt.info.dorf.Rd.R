library(binGroup)


### Name: opt.info.dorf
### Title: Find the characteristics of an informative two-stage
###   hierarchical (Dorfman) algorithm
### Aliases: opt.info.dorf

### ** Examples

# Find the characteristics of an informative
#   Dorfman algorithm, using the OD procedure.
# This example takes less than 1 second to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
opt.info.dorf(prob=rbeta(1000,1,10), se=1, sp=1, 
method ="OD", max.pool=15, thresh.pool=8, threshold=NULL)

# Find the characteristics of an informative 
#   Dorfman algorithm, using the TOD procedure.
# This example takes less than 1 second to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
set.seed(1002)
p.vec <- p.vec.func(p=0.01, alpha=2, grp.sz=20)
opt.info.dorf(prob=p.vec, se=0.95, sp=0.95, 
method="TOD", max.pool=5, threshold=0.015)



