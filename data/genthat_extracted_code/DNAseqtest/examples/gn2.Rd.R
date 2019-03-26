library(DNAseqtest)


### Name: gn2
### Title: Joint Distribution for K Matched Sequences (2)
### Aliases: gn2
### Keywords: Joint distribution

### ** Examples

#To generate a 4^5 gene array
merge2<-matrix(c(-1,-4,-3,2,-2,-5,1,3), 4, 2)
rho2<-matrix(c(.3,.5,.3,.2,.3,.5,.8,2.7),4,2)
theta<-c(rep(.25,3), rep(.25,3),rep(.25,3), c(.2,.35,.79,.01,.93,.47),rho2)
gn2<-gn2(theta, merge2)
gn2



