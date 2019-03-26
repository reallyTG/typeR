library(OjaNP)


### Name: ojaMedian
### Title: Oja Median
### Aliases: ojaMedian ojaMedianEvo ojaMedianGrid ojaMedianEx ojaMedianExB
### Keywords: multivariate nonparametric

### ** Examples


data(biochem)
X <- as.matrix(biochem[,1:2])
ojaMedian(X)
ojaMedian(X, alg = "evo")
ex <-ojaMedian(X, alg = "exact")
exb<-ojaMedian(X, alg = "bounded_exact")

ojaMedianFn(X, ex)
ojaMedianFn(X, exb)



