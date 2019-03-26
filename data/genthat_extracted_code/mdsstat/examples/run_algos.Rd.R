library(mdsstat)


### Name: run_algos
### Title: Run Multiple Algorithms
### Aliases: run_algos run_algos.list run_algos.default

### ** Examples

data <- mds_ts[[3]]
data$rate <- data$nA / data$exposure
x <- list(prr=list(),
  shewhart=list(),
  shewhart=list(ts_event=c(Rate="rate"), we_rule=2L),
  poisson_rare=list(p_rate=0.3))
algos <- define_algos(x)
run_algos(data, algos)
run_algos(data, algos, FALSE)



