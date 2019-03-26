library(DNAseqtest)


### Name: Distance
### Title: Paralinear Distances
### Aliases: Distance
### Keywords: Distance between sequences

### ** Examples

merge2<-matrix(c(-1,-4,-3,2,-2,-5,1,3), 4, 2)
theta<-c(rep(.25,3), rep(.25,3), rep(.25,3), c(.2,.35,.79,.01,.93,.47), 3,.1,.5,.8)
F1<-gn(theta,merge2)
dn<-Distance(F1)
dn



