library(discreteRV)


### Name: SofI
### Title: Sum of independent random variables
### Aliases: SofI

### ** Examples

X.Bern <- RV(c(1,0), c(.5,.5))
X.fair.die <- RV(1:6, rep(1/6,6))

S5 <- SofI(X.Bern, X.Bern, X.Bern, X.Bern, X.Bern)
S.mix <- SofI(X.Bern, X.fair.die)  # Independent but not IID



