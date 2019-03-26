library(clinfun)


### Name: jonckheere.test
### Title: Exact/permutation version of Jonckheere-Terpstra test
### Aliases: jonckheere.test
### Keywords: htest

### ** Examples

  set.seed(1234)
  g <- rep(1:5, rep(10,5))
  x <- rnorm(50)
  jonckheere.test(x+0.3*g, g)
  x[1:2] <- mean(x[1:2]) # tied data
  jonckheere.test(x+0.3*g, g)
  jonckheere.test(x+0.3*g, g, nperm=5000)



