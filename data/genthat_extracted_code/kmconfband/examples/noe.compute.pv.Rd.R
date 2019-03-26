library(kmconfband)


### Name: noe.compute.pv
### Title: Elements of the Noe Recursions for the Exact Coverage
###   Probability of a Nonparametric Confidence Band for the Survivor
###   Function
### Aliases: noe.compute.pv

### ** Examples

## Check of Noe recursion calculations.

a<-c(0.001340,0.028958,0.114653,0.335379)
b<-c(0.664621,0.885347,0.971042,0.998660)
cgh.mat<-noe.compute.cgh(4,a,b)
x<-cgh.mat[,1]
noe.compute.pv(4,x[-10])



