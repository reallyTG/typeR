library(HMMEsolver)


### Name: SolveHMME
### Title: Solve Henderson's Mixed Model Equation.
### Aliases: SolveHMME

### ** Examples

## small setting for data generation
n = 100; m = 2; p = 2
nm = n*m;   nmp = n*m*p

## generate artifical data
X = matrix(rnorm(nmp, 2,1), nm,p) # design matrix
Y = rnorm(nm, 2,1)                # observation

Mu = rep(1, times=nm)
Lambda = rep(1, times=n)

## solve
ans = SolveHMME(X, Y, Mu, Lambda)





