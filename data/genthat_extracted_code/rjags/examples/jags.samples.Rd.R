library(rjags)


### Name: jags.samples
### Title: Generate posterior samples
### Aliases: jags.samples
### Keywords: models

### ** Examples

  data(LINE)
  LINE$recompile()
  LINE.samples <- jags.samples(LINE, c("alpha","beta","sigma"),
  n.iter=1000)
  LINE.samples
  LINE.samples <- jags.samples(LINE, c("alpha","beta","sigma"),
  force.list=TRUE, n.iter=1000)
  LINE.samples
  LINE.samples <- jags.samples(LINE, c("alpha","alpha"),
  n.iter=1000, type=c("trace","mean"))
  LINE.samples$trace
  LINE.samples$mean



