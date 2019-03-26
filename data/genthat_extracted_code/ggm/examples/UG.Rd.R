library(ggm)


### Name: UG
### Title: Defining an undirected graph (UG)
### Aliases: UG
### Keywords: graphs models multivariate

### ** Examples

## X independent of Y given Z
UG(~ X*Z + Y*Z)

# The saturated model
UG(~ X*Y*Z)

## The model without three-way interactions has the same graph
UG(~ X*Y + Y*Z + Z*X)
UG(~ (X + Y + Z)^2)

## Butterfly model defined from the cliques
UG(~ mec*vec*alg + alg*ana*sta)

## Some isolated nodes
UG(~x*y*z + a + b) 



