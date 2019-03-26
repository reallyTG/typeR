library(gama)


### Name: gama.how.many.k
### Title: Estimates the optimal number of partitions.
### Aliases: gama.how.many.k
### Keywords: file

### ** Examples

# loads data about CPU execution metrics of a distributed
# version of Alternating Least Squares (ALS) algorithm
library(gama)
data(cpu.als)

# call estimation by using minimal method (Elbow graphic)
k <- gama.how.many.k (cpu.als)
print(k)

# call estimation by using broad method (NbClust)
k <- gama.how.many.k (cpu.als, method = 'broad')
print(k)




