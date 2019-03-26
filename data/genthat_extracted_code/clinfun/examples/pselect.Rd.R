library(clinfun)


### Name: pselect
### Title: Probability of selection under pick the winner rule
### Aliases: pselect
### Keywords: design

### ** Examples

  # selection when no diffrence i.e. type I error
  pselect(18, c(0.2, 0.2, 0.2))
  # selection probability
  pselect(18, c(0.2, 0.2, 0.4))
  pselect(26, c(0.2, 0.2, 0.4), min.diff=2, min.resp=3)
  # unequal sample size case
  pselect(c(27,54), c(0.5, 0.65), min.diff=0.05)
  # unequal sample size case
  pselect(c(27,54), c(0.5, 0.65), min.diff=0.05, min.resp=c(14,27))



