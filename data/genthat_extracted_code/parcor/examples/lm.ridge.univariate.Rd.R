library(parcor)


### Name: lm.ridge.univariate
### Title: Ridge Regression for a single predictor variable
### Aliases: lm.ridge.univariate
### Keywords: univariate

### ** Examples

n<-100 # number of observations
x<-rnorm(100)
y<-rnorm(n)
ridge.object<-lm.ridge.univariate(x,y,lambda=1:10)



