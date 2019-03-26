library(ReliabilityTheory)


### Name: expectedSystemLifetimeExp
### Title: Compute the expected lifetime of a given system
### Aliases: expectedSystemLifetimeExp expectedNetworkLifetimeExp
###   expectedSignatureLifetimeExp
### Keywords: system expected lifetime signature

### ** Examples

# Find the expected lifetime of two component series system
expectedSystemLifetimeExp(graph.formula(s -- 1 -- 2 -- t))

# Find the expected lifetime of two component series system using it's signature directly
expectedSignatureLifetimeExp(c(1,0))

# Find the expected lifetime of two component parallel system
expectedSystemLifetimeExp(graph.formula(s -- 1:2 -- t))

# Find the expected lifetime of two component parallel system using it's signature directly
expectedSignatureLifetimeExp(c(0,1))



