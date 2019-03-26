library(RcppExamples)


### Name: RcppRNGsExample
### Title: Rcpp RNGs example
### Aliases: RcppRNGsExample
### Keywords: programming interface

### ** Examples

  set.seed(42)
  X <- RcppRNGsExample(10L)
  set.seed(42)
  Y <- data.frame(rnorm=rnorm(10),rt=rt(10,1),rpois=rpois(10,1))
  all.equal(X,Y)



