library(rsvd)


### Name: rpca
### Title: Randomized principal component analysis (rpca).
### Aliases: rpca

### ** Examples


library('rsvd')
#
# Load Edgar Anderson's Iris Data
#
data('iris')

#
# log transform
#
log.iris <- log( iris[ , 1:4] )
iris.species <- iris[ , 5]

#
# Perform rPCA and compute only the first two PCs
#
iris.rpca <- rpca(log.iris, k=2)
summary(iris.rpca) # Summary
print(iris.rpca) # Prints the rotations

#
# Use rPCA to compute all PCs, similar to \code{prcomp}
#
iris.rpca <- rpca(log.iris)
summary(iris.rpca) # Summary
print(iris.rpca) # Prints the rotations
plot(iris.rpca) # Produce screeplot, variable and individuls factor maps.




