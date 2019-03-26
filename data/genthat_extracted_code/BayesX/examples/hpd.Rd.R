library(BayesX)


### Name: hpd
### Title: Computing Highest Posterior Density (HPD) Intervals
### Aliases: hpd hpd.coda
### Keywords: MCMC

### ** Examples

res <- read.table(system.file("examples/nonparametric_f_x_pspline_sample.raw",
  package="BayesX"), header = TRUE)
hpd(res)
hpd.coda(res)



