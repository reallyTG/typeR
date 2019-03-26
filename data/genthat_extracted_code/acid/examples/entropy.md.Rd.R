library(acid)


### Name: entropy.md
### Title: Generalised Entropy Measure for a Mixture of Income
###   Distributions
### Aliases: entropy.md

### ** Examples
 
theta<-c(2,1,5,2)
x<- c(rgamma(500,2,1),rgamma(500,5,2))
para<-1
entropy(x,para)
data(dist.para.t)
entropy.md(100,para,"gamma","gamma",theta,0,0.5,0.5,dist.para.t,zero.approx=1)$entropy



