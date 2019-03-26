library(MTE)


### Name: lnt
### Title: Tangent-likelihood function.
### Aliases: lnt

### ** Examples

set.seed(2017)
x=c(rnorm(80), rnorm(20, 10, 10))
f=dnorm(x)
y=lnt(f, 0.1, 2)



