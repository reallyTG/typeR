library(clinfun)


### Name: aucVardiTest
### Title: Two-Sample Tests for Growth Curves under Dependent Right
###   Censoring
### Aliases: aucVardiTest
### Keywords: htest

### ** Examples

  grp <- sample(1:3, 100, replace=TRUE)
  grp0 <- LETTERS[grp]
  maxfup <- sample(5:20, 100, replace=TRUE)
  meas <- matrix(NA, 100, 20)
  for(i in 1:100) {
    meas[i, 1:maxfup[i]] <- cumsum((3+0.04*grp[i]) + rnorm(maxfup[i]))
  }
  aucVardiTest(meas, grp)
  aucVardiTest(meas, grp0, cgrps=c("C","B"))



