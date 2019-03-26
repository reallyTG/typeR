library(circular)


### Name: rayleigh.test
### Title: Rayleigh Test of Uniformity
### Aliases: rayleigh.test print.rayleigh.test
### Keywords: htest

### ** Examples

x <- rvonmises(n=25, mu=circular(pi), kappa=2)
# General alternative
rayleigh.test(x)
# Specified alternative
rayleigh.test(x, mu=circular(0))



