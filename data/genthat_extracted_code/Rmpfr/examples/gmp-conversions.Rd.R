library(Rmpfr)


### Name: gmp-conversions
### Title: Conversion Utilities gmp <-> Rmpfr
### Aliases: .bigq2mpfr .bigz2mpfr .mpfr2bigz coerce,bigq,mpfr-method
###   coerce,bigz,mpfr-method
### Keywords: arith

### ** Examples

 S <- gmp::Stirling2(50,10)
 show(S)
 SS <- S * as.bigz(1:3)^128
 stopifnot(all.equal(log2(SS[2]) - log2(S), 128, tolerance=1e-15),
           identical(SS, .mpfr2bigz(.bigz2mpfr(SS))))

 .bigz2mpfr(S)            # 148 bit precision
 .bigz2mpfr(S, precB=256) # 256 bit

 ## rational --> mpfr:
 sq <- SS / as.bigz(2)^100
 MP <- as(sq, "mpfr")
 stopifnot(identical(MP, .bigq2mpfr(sq)),
           SS == MP * as(2, "mpfr")^100)



