library(energy)


### Name: eqdist.etest
### Title: Multisample E-statistic (Energy) Test of Equal Distributions
### Aliases: eqdist.etest eqdist.e ksample.e
### Keywords: multivariate htest nonparametric

### ** Examples

 data(iris)

 ## test if the 3 varieties of iris data (d=4) have equal distributions
 eqdist.etest(iris[,1:4], c(50,50,50), R = 199)

 ## example that uses method="disco"
  x <- matrix(rnorm(100), nrow=20)
  y <- matrix(rnorm(100), nrow=20)
  X <- rbind(x, y)
  d <- dist(X)

  # should match edist default statistic
  set.seed(1234)
  eqdist.etest(d, sizes=c(20, 20), distance=TRUE, R = 199)

  # comparison with edist
  edist(d, sizes=c(20, 10), distance=TRUE)

  # for comparison
  g <- as.factor(rep(1:2, c(20, 20)))
  set.seed(1234)
  disco(d, factors=g, distance=TRUE, R=199)

  # should match statistic in edist method="discoB", above
  set.seed(1234)
  disco.between(d, factors=g, distance=TRUE, R=199)



