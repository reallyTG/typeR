library(gIPFrm)


### Name: g.ipf
### Title: Generalized Iterative Proportional Fitting for Relational Models
### Aliases: g.ipf
### Keywords: Exponential Families Iterative Proportional Fitting

### ** Examples


### Multiplicative model from Aitchison and Silvey (1960)

A = matrix(c(1, 0, 0, 1, 0, 1, 1, 
             0, 1, 0, 1, 1, 0, 1,
             0, 0, 1, 0, 1, 1, 1), byrow=TRUE, nrow=3) ## the model matrix 

y = c(46,24,7,15,3,4,1) ## the observed data

g.ipf(A, y, 1e-6, "probabilities", "bisection")
g.ipf(A, y, 1e-4, "probabilities", "grid")



### Bait study in swimming crabs, see Kawamura at al. (1995) :  

A = matrix(c(1,1,0,1,0,1), 2,3,byrow=TRUE) ## the model matrix

y1 = c(36,2,11)  ## the observed data for Charybdis japonica
y2 = c(71,3,44)  ## the observed data for Portunuspelagicus 

## If the model is for intensities, the adjustemnt factor is equal to one;
## the adjustment parameter is redundant.

g.ipf(A, y1, 1e-6, "intensities", "none")
g.ipf(A, y2, 1e-6, "intensities", "none")






