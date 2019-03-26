library(ltsa)


### Name: SimGLP
### Title: Simulate GLP given innovations
### Aliases: SimGLP
### Keywords: ts datagen

### ** Examples

#Simulate an AR(1) process with parameter phi=0.8 of length n=100 with
#  innovations from a t-distribution with 5 df and plot it.
#
phi<-0.8
psi<-phi^(0:127)
n<-100
Q<-length(psi)-1
a<-rt(n+Q,5)
z<-SimGLP(psi,a)
z<-ts(z)
plot(z)



