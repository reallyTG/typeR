library(BioFTF)


### Name: betasecond
### Title: Compute the values of the second derivative of beta profile for
###   each community in every part of the beta domain.
### Aliases: betasecond

### ** Examples

a=c(0.35,0.35,0.27,0.01,0.02)
b=c(0.54,0.20,0.17,0.06,0.03)
c=c(0.35,0.35,0.30,0,0)
d=c(0.51,0.31,0.07,0.10,0.01)
e=c(0.40,0.20,0.10,0.30,0)
x=matrix(rbind(a,b,c,d,e),5,5)
x
betasecond(x,20)




