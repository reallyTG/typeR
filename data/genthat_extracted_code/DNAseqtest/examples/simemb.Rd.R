library(DNAseqtest)


### Name: simemb
### Title: Generating Random DNA Samples Using Embedded Markov Chain
### Aliases: simemb
### Keywords: Generate sequence

### ** Examples

# This will give 4^5 observed divergence array
theta<-(c(rep(.25,3), rep(.25,3), rep(.25,3), c(.2,.35,.79,.01,.93,.47),
3,.1,.5,.8))
n<-1000
merge2<-matrix(c(-1,-4,-3,2,-2,-5,1,3), 4, 2)
sm<-simemb(theta, n, merge2)
sm



