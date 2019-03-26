library(nCopula)


### Name: Node
### Title: Obtain a node in mother class object
### Aliases: Node

### ** Examples

# We directly give the path of the desired node.
Node(c(0,2,2), LOG(0.5, NULL, list(GAMMA(1/30, c(5,6), NULL),
                              LOG(0.1, NULL, list(GAMMA(1/30, c(1,2), NULL),
                              GAMMA(1/30, c(3,4), NULL))))))

# Here we provide the path with the GeneticCodes function of this package.
structure <- LOG(0.5, NULL, list(GAMMA(1/30, c(5,6), NULL),
                                     LOG(0.1, NULL, list(GAMMA(1/30, c(1,2), NULL),
                                     GAMMA(1/30, c(3,4), NULL)))))
Node(GeneticCodes(structure)[[3]], structure)




