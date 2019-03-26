library(kernlab)


### Name: couple
### Title: Probabilities Coupling function
### Aliases: couple
### Keywords: classif

### ** Examples

## create artificial pairwise probabilities
pairs <- matrix(c(0.82,0.12,0.76,0.1,0.9,0.05),2)

couple(pairs)

couple(pairs, coupler="pkpd")

couple(pairs, coupler ="vote")



