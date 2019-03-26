library(RSurveillance)


### Name: pfree.calc
### Title: Probability of freedom over time
### Aliases: pfree.calc
### Keywords: methods

### ** Examples

# examples for pfree.calc
pfree.calc(0.8, 0.01, 0.5)
pfree.calc(rep(0.6,24), 0.01, 0.5)
pfree.calc(runif(10, 0.4, 0.6), 0.01, 0.5)
pfree.calc(runif(10, 0.4, 0.6), runif(10, 0.005, 0.015), 0.5)



