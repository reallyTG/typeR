library(acid)


### Name: ineq.md
### Title: Three Inequality Measures for a Mixture of Income Distributions
### Aliases: ineq.md

### ** Examples

 
theta<-c(0,1,5,2)
x<- c(rgamma(500,2,1),rgamma(500,5,2))
entropy(x,0)
entropy(x,1)
gini(x)$Gini
data(dist.para.t)
im<-ineq.md(100,"gamma","gamma",theta,0,0.5,0.5,dist.para.t,zero.approx=1)
im$MLD
im$Theil
im$Gini



