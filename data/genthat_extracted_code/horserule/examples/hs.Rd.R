library(horserule)


### Name: hs
### Title: Horseshoe regression Gibbs-sampler
### Aliases: hs

### ** Examples

x = matrix(rnorm(1000), ncol=10)
y = apply(x,1,function(x)sum(x[1:5])+rnorm(1))
hsmod = hs(X=x, y=y, niter=100)



