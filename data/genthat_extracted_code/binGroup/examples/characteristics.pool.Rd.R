library(binGroup)


### Name: characteristics.pool
### Title: Testing expenditure for informative Dorfman testing
### Aliases: characteristics.pool

### ** Examples

# This example takes less than 1 second to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
set.seed(8135)
p.vec <- p.vec.func(p=0.02, alpha=1, grp.sz=10)
characteristics.pool(p=p.vec[1:3], se=0.90, sp=0.90)



