library(DNAseqtest)


### Name: Ntml
### Title: Generating Samples from a Multinomial Distribution
### Aliases: Ntml
### Keywords: Generated sample

### ** Examples

#This will give a 4^K observed divergence array
merge2<-matrix(c(-1,-4,-3,2,-2,-5,1,3), 4, 2)
theta<-c(rep(.25,3), rep(.25,3), rep(.25,3), c(.2,.35,.79,.01,.93,.47),
3,.1,.5,.8)
F1<-gn(theta,merge2)
Nt<-Ntml(1000, F1)
Nt



