library(cmvnorm)


### Name: var
### Title: Variance and standard deviation of complex vectors
### Aliases: var sd sd.complex sd.default var.complex var.default

### ** Examples


sd(rcnorm(10)) # imaginary component suppressed by zapim()

var(rcmvnorm(1e5,mean=c(0,0)))



