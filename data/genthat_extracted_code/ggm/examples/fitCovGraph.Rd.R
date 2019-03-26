library(ggm)


### Name: fitCovGraph
### Title: Fitting of Gaussian covariance graph models
### Aliases: fitCovGraph
### Keywords: graphs models multivariate

### ** Examples

## Correlations among four strategies to cope with stress for 
## 72 students. Cox & Wermuth (1996), p. 73.

data(stress)

## A chordless 4-cycle covariance graph
G <- UG(~ Y*X + X*U + U*V + V*Y)

fitCovGraph(G, S = stress, n=72)
fitCovGraph(G, S = stress, n=72, alg="dual")



