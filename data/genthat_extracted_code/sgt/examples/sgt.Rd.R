library(sgt)


### Name: sgt
### Title: The Skewed Generalized T Distribution
### Aliases: SGT sgt dsgt psgt qsgt rsgt
### Keywords: distribution

### ** Examples

require(graphics)

### This shows how to get a normal distribution
x = seq(-4,6,by=0.05)
plot(x, dnorm(x, mean=1, sd=1.5), type='l')
lines(x, dsgt(x, mu=1, sigma=1.5), col='blue')

### This shows how to get a cauchy distribution
plot(x, dcauchy(x, location=1, scale=1.3), type='l')
lines(x, dsgt(x, mu=1, sigma=1.3, q=1/2, mean.cent=FALSE, var.adj = sqrt(2)), col='blue')

### This shows how to get a Laplace distribution
plot(x, dsgt(x, mu=1.2, sigma=1.8, p=1, var.adj=FALSE), type='l', col='blue')

### This shows how to get a uniform distribution
plot(x, dunif(x, min=1.2, max=2.6), type='l')
lines(x, dsgt(x, mu=1.9, sigma=0.7, p=Inf, var.adj=FALSE), col='blue')




