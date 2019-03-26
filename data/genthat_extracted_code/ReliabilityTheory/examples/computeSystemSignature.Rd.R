library(ReliabilityTheory)


### Name: computeSystemSignature
### Title: Compute the signature of a system
### Aliases: computeSystemSignature computeNetworkSignature
### Keywords: system signature

### ** Examples

# Find the signature of two component series system (which is just s=(1, 0))
computeSystemSignature(graph.formula(s -- 1 -- 2 -- t))

# Find the signature of two component parallel system (which is just s=(0, 1))
computeSystemSignature(graph.formula(s -- 1:2 -- t))

# Find the signature of the five component 'bridge' system (which
# is s=(0, 0.2, 0.6, 0.2, 0))
computeSystemSignature(graph.formula(s -- 1 -- 2 -- t, s -- 3 -- 4 -- t, 1:2 -- 5 -- 3:4))



