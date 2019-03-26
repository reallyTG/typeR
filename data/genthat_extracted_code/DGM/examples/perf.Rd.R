library(DGM)


### Name: perf
### Title: Performance of estimates, such as sensitivity, specificity, and
###   more.
### Aliases: perf

### ** Examples

trueNet=matrix(c(0,0,0,1,0,0,0,1,0),3,3)
am=matrix(c(0,0,0,1,0,1,0,1,0),3,3)
p=perf(am, trueNet)



