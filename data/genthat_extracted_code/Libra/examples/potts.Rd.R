library(Libra)


### Name: potts
### Title: Linearized Bregman solver for composite conditionally likelihood
###   of Potts model with lasso penalty and block-group penalty.
### Aliases: potts
### Keywords: regression

### ** Examples


X = matrix(floor(runif(200*10)*3),200,10)
obj = potts(X,10,nt=100,trate=10,group=TRUE)




