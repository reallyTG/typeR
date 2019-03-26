library(tmle)


### Name: summary.tmle
### Title: Summarization of the results of a call to the tmle routine
### Aliases: summary.tmle print.summary.tmle print.tmle summary.tmle.list
###   print.summary.tmle.list print.tmle.list

### ** Examples

# generate data
  set.seed(10)
  n <- 500
  W <- matrix(rnorm(n*3), ncol=3)
  A <- rbinom(n,1, 1/(1+exp(-(.1*W[,1] - .1*W[,2] + .5*W[,3]))))
  Y <- A + 2*W[,1] + W[,3] + W[,2]^2 + rnorm(n)
  colnames(W) <- paste("W",1:3, sep="")

  result <- tmle(Y,A,W, Qform="Y~A+W1", g1W=rep(.5, n))
  summary(result)



