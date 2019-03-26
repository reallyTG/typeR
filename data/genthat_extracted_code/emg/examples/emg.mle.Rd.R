library(emg)


### Name: emg.mle
### Title: Maximum Likelihood estimate of parameters
### Aliases: emg.mle

### ** Examples

  emg.mle(remg(200))
  
  ## a example involving fitting
  data(pc9_3um_erlotinib)

  intermitotic.time <- subset(pc9_3um_erlotinib, end.of.movie=='N' & died=='N')$observed

  hist(intermitotic.time, freq=FALSE, main="PC9 in 3um erlotinib", xlab='intermitotic time (hours)')

  fit <- emg.mle(intermitotic.time)
  pdf <- function(x) demg(x, coef(fit)['mu'], coef(fit)['sigma'], coef(fit)['lambda'])
  curve(pdf, from=0, to=170, add=TRUE, col='red')



