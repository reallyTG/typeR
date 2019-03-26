library(surveillance)


### Name: aggregate-methods
### Title: Aggregate an '"sts"' Object Over Time or Across Units
### Aliases: aggregate,sts,ANY,ANY-method aggregate,sts-method
### Keywords: methods

### ** Examples

  data("ha.sts")
  dim(ha.sts)
  dim(aggregate(ha.sts,by="unit"))
  dim(aggregate(ha.sts,nfreq=13))



