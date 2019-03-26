library(binGroup)


### Name: Array.Measures
### Title: Operating characteristics for array testing without master
###   pooling
### Aliases: Array.Measures

### ** Examples

# Calculate the operating characteristics for 
#   non-informative array testing without master
#   pooling, with a 5x5 array and an overall disease 
#   risk of p = 0.02.
# This example takes less than 1 second to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
p.mat <- matrix(data=0.02, ncol=5, nrow=5)
Array.Measures(p=p.mat, se=0.95, sp=0.95)

# Calculate the operating characteristics for 
#   informative array testing without master
#   pooling, with a 3x3 array and an overall disease
#   risk of p = 0.03 and alpha = 2.
# This example takes less than 1 second to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
set.seed(8791)
p.vec <- p.vec.func(p=0.03, alpha=2, grp.sz=9)
p.mat <- Informative.array.prob(prob.vec=p.vec, nr=3, 
nc=3, method="gd")
Array.Measures(p=p.mat, se=0.99, sp=0.99)



