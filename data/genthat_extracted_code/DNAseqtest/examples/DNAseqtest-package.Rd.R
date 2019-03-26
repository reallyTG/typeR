library(DNAseqtest)


### Name: DNAseqtest-package
### Title: Generating and Testing DNA Sequences
### Aliases: DNAseqtest-package DNAseqtest
### Keywords: Sequence test

### ** Examples

#To generate a 4^5 gene array
merge2<-matrix(c(-1,-4,-3,2,-2,-5,1,3),4,2)
theta<-c(rep(.25,3), rep(.25,3), rep(.25,3), c(.2,.35,.79,.01,.93,.47), 3,.1,.5,.8)
gn.sec<-gn(theta, merge2)
gn.sec



