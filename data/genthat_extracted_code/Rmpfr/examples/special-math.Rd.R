library(Rmpfr)


### Name: mpfr-special-functions
### Title: Special Mathematical Functions (MPFR)
### Aliases: zeta Ei Li2 erf erfc
### Keywords: math

### ** Examples

curve(Ei,  0, 5, n=2001)

## As we now require (mpfrVersion() >= "2.4.0"):
curve(Li2,  0,    5, n=2001)
curve(Li2, -2,   13, n=2000); abline(h=0,v=0, lty=3)
curve(Li2, -200,400, n=2000); abline(h=0,v=0, lty=3)

curve(erf, -3,3, col = "red", ylim = c(-1,2))
curve(erfc, add = TRUE, col = "blue")
abline(h=0, v=0, lty=3)
legend(-3,1, c("erf(x)", "erfc(x)"), col = c("red","blue"), lty=1)



