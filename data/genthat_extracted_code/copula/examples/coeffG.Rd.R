library(copula)


### Name: coeffG
### Title: Coefficients of Polynomial used for Gumbel Copula
### Aliases: coeffG
### Keywords: arith

### ** Examples

a.k  <- coeffG(16, 0.55)
plot(a.k, xlab = quote(k), ylab = quote(a[k]),
     main = "coeffG(16, 0.55)", log = "y", type = "o", col = 2)
a.kH <- coeffG(16, 0.55, method = "horner")
stopifnot(all.equal(a.k, a.kH, tol = 1e-11))# 1.10e-13 (64-bit Lnx, nb-mm4)



