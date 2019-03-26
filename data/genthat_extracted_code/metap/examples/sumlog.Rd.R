library(metap)


### Name: sumlog
### Title: Combine p-values by the sum of logs (Fisher's) method
### Aliases: sumlog 'Fisher's method' 'chi-square (2) method' print.sumlog
### Keywords: htest

### ** Examples

data(teachexpect)
sumlog(teachexpect) # chisq = 69.473, df = 38, p = 0.0014, from Becker
data(beckerp)
sumlog(beckerp) # chisq = 18.533, df = 10, sig
data(rosenthal)
sumlog(rosenthal$p) # chisq = 22.97, df = 10, p = 0.006 one sided
data(cholest)
sumlog(cholest) # chisq = 58.62, df = 68, p = 0.78
data(validity)
sumlog(validity) # chisq = 159.82, df = 40, p = 2.91 * 10^{-16}
sumlog(c(0.0001, 0.0001, 0.9999, 0.9999)) # is significant



