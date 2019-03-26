library(gmp)


### Name: Bigq operators
### Title: Basic arithmetic operators for large rationals
### Aliases: add.bigq +.bigq sub.bigq -.bigq mul.bigq *.bigq div.bigq
###   /.bigq pow.bigq ^.bigq abs.bigq
### Keywords: arith

### ** Examples

## 1/3 + 1 = 4/3 :
as.bigq(1,3) + 1

r <- as.bigq(12, 47)
stopifnot(r ^ 3 == r*r*r)



