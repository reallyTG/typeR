library(DNAseqtest)


### Name: TEST2
### Title: Test for Symmetry of Matched DNA Sequences
### Aliases: TEST2
### Keywords: Sequence test

### ** Examples

merge2<-matrix(c(-1,-4,-3,2,-2,-5,1,3), 4, 2)
theta<-c(rep(.25,3), rep(.25,3), rep(.25,3), c(.2,.35,.79,.01,.93,.47),
3,.1,.5,.8)
F1<-gn(theta,merge2)
N1<-Ntml(1000,F1)
t2<-TEST2(N1)
t2



