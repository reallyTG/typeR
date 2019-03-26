library(DNAseqtest)


### Name: Fmatrix
### Title: Joint Distribution for Two Matched Sequences
### Aliases: Fmatrix
### Keywords: Joint distribution

### ** Examples

f0<-c(.25,.25,.25,.25)
Pi1<-diag(c(.2,.2,.2,.4))
Pi2<-diag(c(.1,.1,.1,.7))
S1<-Smatrix(c(.2,.2,.2,.2,.2,.2),diag(Pi1))
S2<-Smatrix(c(.3,.3,.3,.3,.3,.3),diag(Pi2))
fm<-Fmatrix(1, .5, f0, S1, S2, Pi1, Pi2)
fm



