library(DNAseqtest)


### Name: simapp
### Title: Generating Random DNA Samples Using Approximation Method
### Aliases: simapp
### Keywords: Generate sequence

### ** Examples

# This will give 4^5 observed divergence array
theta<-(c(rep(.25,3), rep(.25,3), rep(.25,3), c(.2,.2,.2,.2,.2,.2),
3,.1,.5,.8))
n<-1000
merge2<-matrix(c(-1,-4,-3,2,-2,-5,1,3), 4, 2)
sa<-simapp(theta, n, merge2)
sa



