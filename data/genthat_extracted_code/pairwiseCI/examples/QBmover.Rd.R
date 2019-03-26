library(pairwiseCI)


### Name: QBmover
### Title: Confidence intervals for ratios of proportions based on the
###   quasibinomial assumption
### Aliases: QBmover
### Keywords: htest

### ** Examples

QBmover(succ=c(0,0,1,  0,6,8), fail=c(20,20,18, 20,14,12), 
 trt=factor(rep(c("A", "B"), c(3,3))), conf.level = 0.95,
 alternative = "two.sided", grid = NULL)




