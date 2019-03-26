library(Rmpfr)


### Name: factorialMpfr
### Title: Factorial 'n!'  in Arbitrary Precision
### Aliases: factorialMpfr
### Keywords: arith

### ** Examples

factorialMpfr(200)

n <- 1000:1010
f1000 <- factorialMpfr(n)
stopifnot(1e-15 > abs(as.numeric(1 - lfactorial(n)/log(f1000))))

## Note that---astonishingly--- measurements show only
## *small* efficiency gain of ~ 10% : over using the previous "technique"
system.time(replicate(8, f1e4 <- factorialMpfr(10000)))
system.time(replicate(8, f.1e4 <- factorial(mpfr(10000,
                            prec=1+lfactorial(10000)/log(2)))))



