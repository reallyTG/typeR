library(gIPFrm)


### Name: suff.stat
### Title: Sufficient Statistics under a Relational Model
### Aliases: suff.stat
### Keywords: Sufficient Statistics

### ** Examples


### Multiplicative model from Aitchison and Silvey (1960)

A = matrix(c(1, 0, 0, 1, 0, 1, 1, 
             0, 1, 0, 1, 1, 0, 1,
             0, 0, 1, 0, 1, 1, 1), byrow=TRUE, nrow=3) ## the model matrix 

y = c(46,24,7,15,3,4,1) ## the observed data

suff.stat(A,y) 

### pneumonia infection in calves:

A=matrix(c(2,1,0,0,1,1), 2,3,byrow=TRUE) ## the model matrix

y=c(30,63,63)  ## the observed data

suff.stat(A,y) 




