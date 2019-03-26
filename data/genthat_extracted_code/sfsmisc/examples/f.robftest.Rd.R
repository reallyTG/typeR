library(sfsmisc)


### Name: f.robftest
### Title: Robust F-Test: Wald test for multiple coefficients of rlm()
###   Object.
### Aliases: f.robftest
### Keywords: robust htest

### ** Examples

if(require("MASS")) {
  ## same data as  example(rlm)
  data(stackloss)
  summary(rsl <- rlm(stack.loss ~ ., stackloss))
  f.robftest(rsl)
 } else  " forget it "




