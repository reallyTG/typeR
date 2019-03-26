library(DNAseqtest)


### Name: gn3sim
### Title: Generating Random DNA Samples Using the Rambaut and Grassly
###   Method
### Aliases: gn3sim
### Keywords: Generate sequence

### ** Examples

# This will give 4^5 observed divergence array
theta<-(c(rep(.25,3), rep(.25,3), rep(.25,3), c(.2,.35,.79,.01,.93,.47),
3,.1,.5,.8))
n<-1000
merge2<-matrix(c(-1,-4,-3,2,-2,-5,1,3), 4, 2)
gn3<-gn3sim(theta, n, merge2)
gn3



