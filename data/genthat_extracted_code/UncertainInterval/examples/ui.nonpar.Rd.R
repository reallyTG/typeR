library(UncertainInterval)


### Name: ui.nonpar
### Title: Function for the determination of an inconclusive interval for
###   continuous test scores
### Aliases: ui.nonpar

### ** Examples

# A simple test model
set.seed(1)
ref=c(rep(0,500), rep(1,500))
test=c(rnorm(500,0,1), rnorm(500,1,1))
ui.nonpar(ref, test, select='limited')

ref = c(rep(0,20), rep(1,20))
test= c(rnorm(20), rnorm(20, mean=1))
ui.nonpar(ref, test)




