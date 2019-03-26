library(gIPFrm)


### Name: bisection.update
### Title: Search for the adjustment factor corresponding to the MLE using
###   the bisection method
### Aliases: bisection.update
### Keywords: Bisection Method

### ** Examples


### Multiplicative model from Aitchison and Silvey (1960)

A = matrix(c(1, 0, 0, 1, 0, 1, 1, 
             0, 1, 0, 1, 1, 0, 1,
             0, 0, 1, 0, 1, 1, 1), byrow=TRUE, nrow=3) ## the model matrix 

y = c(46,24,7,15,3,4,1) ## the observed data

bisection.update(A, y, 1e-4)



## The model of independence for a 2 by 2 contingency table

A = matrix(c( 1,1,0,0,
              0,0,1,1,
              1,0,1,0,
              0,1,0,1), byrow=TRUE, nrow=4) ## the model matrix

y = c(1,2,3,4)  ## the observed data


bisection.update(A, y, 1e-5)




