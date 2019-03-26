library(mpe)


### Name: print.power.mpe.test
### Title: Print Methods for Hypothesis Tests, Sample size and Power
###   Calculations
### Aliases: print.mpe.test print.power.mpe.test
### Keywords: htest power.htest

### ** Examples

(pkv <- power.known.var(K = 2, delta = c(1,1), Sigma = diag(c(2,2)), power = 0.9,
                        sig.level = 0.025))
  print(pkv, digits =  4) # using less digits than default
  print(pkv, digits = 12) # using more  "       "



