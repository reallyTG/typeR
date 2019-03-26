library(binGroup)


### Name: opt.pool.size
### Title: Find the optimal pool size for Optimal Dorfman or Thresholded
###   Optimal Dorfman
### Aliases: opt.pool.size

### ** Examples

# This example takes less than 1 second to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
set.seed(8135)
p.vec <- p.vec.func(p=0.02, alpha=1, grp.sz=10)
opt.pool.size(p=p.vec, max.p=3, se=0.95, sp=0.95)



