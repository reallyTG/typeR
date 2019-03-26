library(Rmpfr)


### Name: mpfr-distr-etc
### Title: Distribution Functions etc (MPFR)
### Aliases: pnorm dnorm dbinom dpois mpfr-distr
### Keywords: distribution

### ** Examples

x <- 1400+ 0:10
print(dpois(x, 1000), digits =18) ## standard R's double precision
dpois(mpfr(x, 120), 1000)## more accuracy for the same
dpois(0:5, mpfr(10000, 80)) ## very small exponents

print(dbinom(0:8, 8, pr = 4 / 5), digits=18)
      dbinom(0:8, 8, pr = 4/mpfr(5, 99)) -> dB; dB

print(dnorm(     -5:5), digits=18)
      dnorm(mpfr(-5:5, prec=99))



