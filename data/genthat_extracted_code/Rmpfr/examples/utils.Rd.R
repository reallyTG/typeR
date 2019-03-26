library(Rmpfr)


### Name: mpfr.utils
### Title: MPFR Number Utilities
### Aliases: c.mpfr diff.mpfr mpfrIs0 .mpfr.is.whole mpfrVersion mpfr.is.0
###   mpfr.is.integer
### Keywords: arith

### ** Examples

mpfrVersion()

(x <- c(Const("pi", 64), mpfr(-2:2, 64)))
mpfrIs0(x)    # one of them is
x[mpfrIs0(x)] # but it may not have been obvious..
str(x)

x <- rep(-2:2, 5)
stopifnot(is.whole(mpfr(2, 500) ^ (1:200)),
          all.equal(diff(x), diff(as.numeric(x))))



