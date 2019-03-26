library(coxed)


### Name: make.margeffect
### Title: Calculating a simulated marginal effect
### Aliases: make.margeffect

### ** Examples

T <- 100
N <- 1000
X <- as.matrix(data.frame(X1=rnorm(N), X2=rnorm(N), X3=rnorm(N)))
beta <- as.matrix(rnorm(3))
baseline <- baseline.build(T=T, knots=8, spline=TRUE)
xb <- generate.lm(baseline, X=X, beta=beta, N=N, censor=.1, type="none")
me <- make.margeffect(baseline, xb, covariate=1, low=0, high=1)
me$marg.effect



