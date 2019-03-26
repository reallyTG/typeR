library(mdsstat)


### Name: define_algos
### Title: Set List of Algorithms to Run
### Aliases: define_algos

### ** Examples

x <- list(prr=list(),
  shewhart=list(),
  shewhart=list(ts_event=c(Rate="rate"), we_rule=2L),
  poisson_rare=list(p_rate=0.3))
define_algos(x)



