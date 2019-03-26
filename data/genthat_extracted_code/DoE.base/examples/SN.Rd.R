library(DoE.base)


### Name: SN
### Title: Function for the signal-to-noise ratio 10 * log10(mean^2/var)
### Aliases: SN
### Keywords: array design

### ** Examples

x <- rexp(10)
SN(x)
10 * log10(mean(x)^2/var(x))
20 * log10(mean(x)/sd(x))



