library(Biodem)


### Name: mal.phi
### Title: Calculates a kinship matrix using the Malecot Migration Model
### Aliases: mal.phi
### Keywords: array iteration

### ** Examples

# using Swedlund data again...
data(S); data(P); data(N)
x<-mal.eq(S,P,N)
phi<-mal.phi(S,P,N,x)
phi



