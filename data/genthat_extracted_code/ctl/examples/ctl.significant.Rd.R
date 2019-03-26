library(ctl)


### Name: CTLsignificant
### Title: CTLsignificant - Get all significant interactions from a
###   genome-wide CTLscan
### Aliases: CTLsignificant
### Keywords: methods

### ** Examples

  library(ctl)
  data(ath.result)
  all_interactions <- CTLsignificant(ath.result)
  all_interactions[1:10, ]
  trait1_interactions <- CTLsignificant(ath.result[[1]])
  trait1_interactions



