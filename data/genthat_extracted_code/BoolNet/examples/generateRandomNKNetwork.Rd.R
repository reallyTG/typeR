library(BoolNet)


### Name: generateRandomNKNetwork
### Title: Generate a random N-K Boolean network
### Aliases: generateRandomNKNetwork
### Keywords: LaTeX Boolean network attractor cycle random network

### ** Examples

# generate different random networks
net1 <- generateRandomNKNetwork(n=10, k=10, 
                                topology="scale_free", 
                                linkage="uniform", 
                                functionGeneration="uniform",
                                noIrrelevantGenes=FALSE, 
                                simplify=TRUE)
                                
net2 <- generateRandomNKNetwork(n=10, k=3, 
                                topology="homogeneous", 
                                linkage="lattice", 
                                functionGeneration="uniform", 
                                d_lattice=1.5, 
                                simplify=TRUE)
                                
net3 <- generateRandomNKNetwork(n=10, k=2, 
                                topology="fixed", 
                                linkage="uniform", 
                                functionGeneration="biased", 
                                noIrrelevantGenes=FALSE,                                
                                zeroBias=0.6)

# get attractors
print(getAttractors(net1))
print(getAttractors(net2))
print(getAttractors(net3))



