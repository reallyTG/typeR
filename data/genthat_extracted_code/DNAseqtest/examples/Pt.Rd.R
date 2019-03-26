library(DNAseqtest)


### Name: Pt
### Title: Transition Probability Function
### Aliases: Pt
### Keywords: Transition probability

### ** Examples

Pi<-diag(c(.1,.1,.1,.7)) 
S<-Smatrix(c(.3,.3,.3,.3,.3,.3),diag(Pi))
t<-1
p<-Pt(S, Pi, t)
p



