library(sivipm)


### Name: sivipboot
### Title: Confidence Intervals for the Total Sensitivity Indices by
###   Bootstrap
### Aliases: sivipboot

### ** Examples

X <- cornell0[,1:3] # X-inputs
Y <- as.data.frame( cornell0[,8]) # response variable
# Creation of the polynomial:
P <- vect2polyX(X, c("1", "2", "3", "3*3*3"))
set.seed(15) #alea seed
nloops <- 3 # number of loops, example for fast running
nc <- 2 # number of components
sivipboot(Y, P, nloops, nc, fast=TRUE)




