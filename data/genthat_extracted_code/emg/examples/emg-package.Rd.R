library(emg)


### Name: emg-package
### Title: Exponentially Modified Gaussian (EMG) Distribution
### Aliases: emg-package emg
### Keywords: package

### ** Examples

  y <- remg(200)
  hist(y, freq=FALSE, ylim=c(0, 0.35), breaks=20)
  x <- 1:100/100 * 11 - 3
  lines(x, demg(x))
  m <- emg.mle(y)
  sqrt(diag(m@vcov)) # Show stderr in estimate
  ks.test(y, "pemg", 0, 1, 1)



