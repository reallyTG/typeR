library(PhyInformR)


### Name: allmodel.signal.noise
### Title: A function to compute results of QIRP, QIHP, and QIPP
###   accomodating uneven branch lengths and user defined substitution
###   models or base frequency distributions
### Aliases: allmodel.signal.noise
### Keywords: ~kwd1

### ** Examples

as.matrix(rag1)->rates
a<-1
b<-1
c<-1
d<-1
e<-1
f<-1
Pi_T<-.25
Pi_C<-.25
Pi_A<-.25
Pi_G<-.25
internode<-c(12,12,15,15,.37)
allmodel.signal.noise(a, b, c, d, e, f, internode, Pi_T, Pi_C, Pi_A, Pi_G, rates)



