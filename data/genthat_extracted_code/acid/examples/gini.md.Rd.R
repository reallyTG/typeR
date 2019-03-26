library(acid)


### Name: gini.md
### Title: Gini Coefficient for a Mixture of Income Distributions
### Aliases: gini.md

### ** Examples

 
theta<-c(2,1,5,2)
x<- c(rnorm(500,2,1),rnorm(500,5,2))
gini(x)$Gini
data(dist.para.t)
gini.md(1000,"norm","norm",theta,0,0.5,0.5,dist.para.t)$gini



