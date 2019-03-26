library(BurStMisc)


### Name: summary.genopt
### Title: Summary of genopt object
### Aliases: summary.genopt
### Keywords: optimize

### ** Examples

  # two parameters, population size 5
  go1 <- genopt(function(x, other) sum(x, other),
                population=matrix(rexp(10), nrow=2, ncol=5),
                lower=0, add.arg=list(other=3), trace=FALSE)
  summary(go1)



