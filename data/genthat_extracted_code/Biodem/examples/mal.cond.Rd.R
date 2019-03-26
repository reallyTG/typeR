library(Biodem)


### Name: mal.cond
### Title: Calculates a Conditional Kinship matrix
### Aliases: mal.cond
### Keywords: array manip

### ** Examples

# using Swedlund data again...
data(S); data(P); data(N)
x<-mal.eq(S,P,N)
phi<-mal.phi(S,P,N,x)
cond.mat<-mal.cond(phi,N)
cond.mat



