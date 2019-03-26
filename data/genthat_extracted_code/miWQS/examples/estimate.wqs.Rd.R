library(miWQS)


### Name: estimate.wqs
### Title: Weighted Quantile Sum (WQS) Regression
### Aliases: estimate.wqs
### Keywords: imputation wqs

### ** Examples

#Example 1: Binary outcome using the example simulated dataset in this package.
 data(simdata87)
 set.seed(23456)
 W.bin4  <- estimate.wqs( y = simdata87$y.scenario, X = simdata87$X.true[,1:9],
                  B = 10, family = "binomial")
 unique(warnings())
 W.bin4

#Example 2: Continuous outcome. Use WQSdata example from wqs package.
 if( requireNamespace("wqs", quietly = TRUE) ){
  library(wqs)
  data(WQSdata)
  set.seed(23456)
  Wa <- estimate.wqs (y = WQSdata$y, X = WQSdata[,1:9], B=10)
  Wa
 }else{
  message("you need to install the package wqs for this example")
 }



