library(PropScrRand)


### Name: pba
### Title: Propensity-Biased Allocation
### Aliases: pba pbaAgain
### Keywords: design multivariate

### ** Examples

x0 = data.frame(matrix(rnorm(60), ncol=3))
t0 = rbinom(nrow(x0), size=1, prob=0.5)

x1 = data.frame(matrix(rnorm(3), ncol=3))
trial1 = pba(x=x0, tr=t0, newx=x1, k=Inf)

x2 = data.frame(matrix(rnorm(3), ncol=3))
trial2 = pbaAgain(previous=trial1, newx=x2)

x3 = data.frame(matrix(rnorm(3), ncol=3))
trial3 = pbaAgain(previous=trial2, newx=x3, k=5/3)



