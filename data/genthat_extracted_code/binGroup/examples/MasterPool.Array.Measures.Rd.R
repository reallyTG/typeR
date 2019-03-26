library(binGroup)


### Name: MasterPool.Array.Measures
### Title: Operating characteristics for array testing with master pooling
### Aliases: MasterPool.Array.Measures

### ** Examples

# Calculate the operating characteristics for 
#   non-informative array testing with master
#   pooling, with a 6x6 array and an overall 
#   disease risk of p = 0.10.
# This example takes less than 1 second to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
p.mat <- matrix(data=0.10, ncol=6, nrow=6)
results <- Array.Measures(p=p.mat, se=0.90, sp=0.90)
MasterPool.Array.Measures(results=results, n=36, 
pmat=p.mat, Se=0.90, Sp=0.90)



