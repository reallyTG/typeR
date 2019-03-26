library(MTS)


### Name: PIwgt
### Title: Pi Weight Matrices
### Aliases: PIwgt

### ** Examples

Phi1=matrix(0,2,2); Phi2=matrix(c(0.2,-0.6,0.3,1.1),2,2)
Theta1=diag(c(-0.5,-0.4))
Phi=cbind(Phi1,Phi2)
m1=PIwgt(Phi=Phi,Theta=Theta1)
names(m1)



