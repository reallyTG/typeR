library(sparc)


### Name: sparc
### Title: Training function of Semiparametric Generalized Linear Models
### Aliases: sparc

### ** Examples

## generating training data
n = 100
d = 200
set.seed(3)
X = matrix(rnorm(n*d),n,d)
y = 3*X[,1]+2*X[,2] + 1.5*X[,4] + rnorm(n)

## estimating models
out = sparc(X,y)



