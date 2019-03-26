library(dagitty)


### Name: simulateSEM
### Title: Simulate Data from Structural Equation Model
### Aliases: simulateSEM

### ** Examples

## Simulate data with pre-defined path coefficients of -.6
g <- dagitty('dag{z -> x [beta=-.6] x <- y [beta=-.6] }')
x <- simulateSEM( g ) 
cov(x)





