library(MTS)


### Name: VARMAirf
### Title: Impulse Response Functions of a VARMA Model
### Aliases: VARMAirf

### ** Examples

p1=matrix(c(0.2,-0.6,0.3,1.1),2,2)
th1=matrix(c(-0.5,0.2,0.0,-0.6),2,2)
Sig=matrix(c(4,1,1,1),2,2)
m1=VARMAirf(Phi=p1,Theta=th1,Sigma=Sig)



