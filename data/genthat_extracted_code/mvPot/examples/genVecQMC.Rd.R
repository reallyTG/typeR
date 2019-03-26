library(mvPot)


### Name: genVecQMC
### Title: Generating vectors for lattice rules
### Aliases: genVecQMC

### ** Examples

#Define the number of sample.
p <- 500

#Choose a dimension
d <- 300

#Compute the generating vector
latticeRule <- genVecQMC(p,d)

print(latticeRule$primeP)
print(latticeRule$genVec)




