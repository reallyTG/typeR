library(gIPFrm)


### Name: gIPFrm-package
### Title: Generalized Iterative Proportional Fitting for Relational Models
### Aliases: gIPFrm-package gIPFrm

### ** Examples


### Multiplicative model from Aitchison and Silvey (1960)

A = matrix(c(1, 0, 0, 1, 0, 1, 1, 
             0, 1, 0, 1, 1, 0, 1,
             0, 0, 1, 0, 1, 1, 1), byrow=TRUE, nrow=3) ## the model matrix 

y = c(46,24,7,15,3,4,1) ## the observed data

g.ipf(A, y, 1e-4, "probabilities", "grid")
g.ipf(A, y, 1e-6, "probabilities", "bisection")




