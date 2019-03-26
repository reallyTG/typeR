library(acid)


### Name: atkinson.md
### Title: Atkinson Index for a Mixture of Income Distributions
### Aliases: atkinson.md

### ** Examples

theta<-c(2,1,5,2)
x<- c(rgamma(50000,2,1),rgamma(50000,5,2))
para<-1

data(dist.para.t)
atkinson.md(10000,para,"gamma","gamma",theta,0,0.5,0.5,dist.para.t,zero.approx=1)$AIM
atkinson(x,1)




