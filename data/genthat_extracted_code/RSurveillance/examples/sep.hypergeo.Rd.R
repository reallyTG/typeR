library(RSurveillance)


### Name: sep.hypergeo
### Title: Hypergeometric Population sensitivity
### Aliases: sep.hypergeo
### Keywords: methods

### ** Examples

# examples for sep.hypergeo - checked
sep.hypergeo(N=100, n=50, d=1, se = 0.92)
inf<- 1:5
sens<- 0.8
sep.hypergeo(N=100, n=50, d=inf, se=sens)
N<- c(10, 50, 100, 250, 500)
sep.hypergeo(se=0.8, N=N, n=c(5, 25, 50, 125, 250), d = ceiling(0.01*N))



