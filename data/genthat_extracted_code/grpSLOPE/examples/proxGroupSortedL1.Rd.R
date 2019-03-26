library(grpSLOPE)


### Name: proxGroupSortedL1
### Title: Prox for group SLOPE
### Aliases: proxGroupSortedL1

### ** Examples

grp <- c(0,0,0,1,1,0,2,1,0,2)
proxGroupSortedL1(y = 1:10, group = grp, lambda = c(10, 9, 8))
#  [1] 0.2032270 0.4064540 0.6096810 0.8771198 1.0963997 1.2193620 1.3338960
#  [8] 1.7542395 1.8290430 1.9055657




