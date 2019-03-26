library(sfsmisc)


### Name: KSd
### Title: Approximate Critical Values for Kolmogorov-Smirnov's D
### Aliases: KSd
### Keywords: distribution

### ** Examples

KSd(90)
KSd(1:9)# now works

op <- par(mfrow=c(2,1))
  plot(KSd, 10, 150)# nice
  abline(v = c(75,85), col = "gray")
  plot(KSd, 79, 81, n = 1001)# *very* tiny discontinuity at 80
par(op)



