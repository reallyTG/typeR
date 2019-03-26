library(Rmpfr)


### Name: mpfr-class
### Title: Class "mpfr" of Multiple Precision Floating Point Numbers
### Aliases: mpfr-class mpfr1-class summaryMpfr-class [[,mpfr-method
###   [,mpfr,ANY,missing,missing-method [<-,mpfr,missing,missing,ANY-method
###   [<-,mpfr,ANY,missing,ANY-method [<-,mpfr,ANY,missing,mpfr-method
###   as.numeric,mpfr-method as.vector,mpfrArray-method
###   as.integer,mpfr-method beta,ANY,mpfr-method beta,ANY,mpfrArray-method
###   beta,mpfr,ANY-method beta,mpfr,mpfr-method beta,mpfr,numeric-method
###   beta,numeric,mpfr-method beta,mpfrArray,ANY-method
###   beta,mpfrArray,mpfrArray-method lbeta,ANY,mpfr-method
###   lbeta,ANY,mpfrArray-method lbeta,mpfr,ANY-method
###   lbeta,mpfr,mpfr-method lbeta,mpfr,numeric-method
###   lbeta,numeric,mpfr-method lbeta,mpfrArray,ANY-method
###   lbeta,mpfrArray,mpfrArray-method atan2,ANY,mpfr-method
###   atan2,ANY,mpfrArray-method atan2,mpfr,ANY-method
###   atan2,mpfr,mpfr-method atan2,mpfr,numeric-method
###   atan2,numeric,mpfr-method atan2,mpfrArray,ANY-method
###   atan2,mpfrArray,mpfrArray-method hypot coerce,mpfr,character-method
###   coerce,mpfr,numeric-method coerce,mpfr,bigz-method
###   coerce,mpfr,integer-method coerce,mpfr1,numeric-method
###   coerce,mpfr1,mpfr-method coerce,integer,mpfr-method
###   coerce,logical,mpfr-method coerce,raw,mpfr-method
###   coerce,numeric,mpfr-method coerce,numeric,mpfr1-method
###   coerce,array,mpfr-method coerce,character,mpfr-method
###   coerce,mpfr,mpfr1-method Ops,mpfr,ANY-method Ops,ANY,mpfr-method
###   Ops,mpfr,bigq-method Ops,bigq,mpfr-method Ops,mpfr,bigz-method
###   Ops,bigz,mpfr-method Ops,array,mpfr-method Ops,mpfr,array-method
###   Ops,mpfr,vector-method Ops,vector,mpfr-method Arith,mpfr,array-method
###   Arith,mpfr,missing-method Arith,mpfr,mpfr-method
###   Arith,mpfr,integer-method Arith,mpfr,numeric-method
###   Arith,integer,mpfr-method Arith,numeric,mpfr-method
###   Arith,array,mpfr-method Compare,mpfr,mpfr-method
###   Compare,mpfr,integer-method Compare,mpfr,numeric-method
###   Compare,integer,mpfr-method Compare,numeric,mpfr-method
###   Compare,mpfr,array-method Compare,array,mpfr-method
###   Logic,mpfr,mpfr-method Logic,mpfr,numeric-method
###   Logic,numeric,mpfr-method Summary,mpfr-method Math,mpfr-method
###   Math2,mpfr-method abs,mpfr-method log,mpfr-method
###   factorial,mpfr-method sign,mpfr-method Re,mpfr-method Im,mpfr-method
###   Mod,mpfr-method Arg,mpfr-method Conj,mpfr-method format,mpfr-method
###   is.finite,mpfr-method is.infinite,mpfr-method is.na,mpfr-method
###   is.nan,mpfr-method is.finite,mpfrArray-method
###   is.infinite,mpfrArray-method is.na,mpfrArray-method
###   is.nan,mpfrArray-method unique,mpfr,missing-method
###   all.equal,mpfr,mpfr-method all.equal,mpfr,ANY-method
###   all.equal,ANY,mpfr-method mean,mpfr-method median,mpfr-method
###   quantile,mpfr-method summary,mpfr-method dim<-,mpfr-method
###   t,mpfr-method %*%,array_or_vector,mpfr-method
###   %*%,mpfr,array_or_vector-method crossprod,array_or_vector,mpfr-method
###   crossprod,mpfr,array_or_vector-method
###   tcrossprod,array_or_vector,mpfr-method
###   tcrossprod,mpfr,array_or_vector-method which.min,mpfr-method
###   which.max,mpfr-method show,mpfr-method show,mpfr1-method
###   show,summaryMpfr-method print.mpfr1 print.summaryMpfr
### Keywords: classes

### ** Examples

## 30 digit precision
str(x <- mpfr(c(2:3, pi), prec = 30 * log2(10)))
x^2
x[1] / x[2] # 0.66666... ~ 30 digits

## indexing - as with numeric vectors
stopifnot(identical(x[2], x[[2]]),
	  ## indexing "outside" gives NA (well: "mpfr-NaN" for now):
	  is.na(x[5]),
	  ## whereas "[[" cannot index outside:
	  is(try(x[[5]]), "try-error"),
	  ## and only select *one* element:
	  is(try(x[[2:3]]), "try-error"))

## factorial() & lfactorial would work automagically via [l]gamma(),
## but factorial() additionally has an "mpfr" method which rounds
f200 <- factorial(mpfr(200, prec = 1500)) # need high prec.!
f200
as.numeric(log2(f200))# 1245.38 -- need precBits >~ 1246 for full precision

##--> see  factorialMpfr() for more such computations.

##--- "Underflow" **much** later -- exponents have 30(+1) bits themselves:

mpfr.min.exp2 <- - (2^30 + 1)
two <- mpfr(2, 55)
stopifnot(two ^ mpfr.min.exp2 == 0)
## whereas
two ^ (mpfr.min.exp2 * (1 - 1e-15))
## 2.38256490488795107e-323228497   ["typically"]

##--- "Assert" that {sort}, {order}, {quantile}, {rank}, all work :

p <- mpfr(rpois(32, lambda=500), precBits=128)^10
np <- as.numeric(log(p))
(sp <- summary(p))# using the print.summaryMpfr() method
stopifnot(all(diff(sort(p)) >= 0),
   identical(order(p), order(np)),
   identical(rank (p), rank (np)),
   all.equal(sapply(1:9, function(Typ) quantile(np, type=Typ, names=FALSE)),
      sapply(lapply(1:9, function(Typ) quantile( p, type=Typ, names=FALSE)),
	     function(x) as.numeric(log(x))),
      tol = 1e-3),# quantiles: interpolated in orig. <--> log scale
 TRUE)

m0 <- mpfr(numeric(), 99)
xy <- expand.grid(x = -2:2, y = -2:2) ; x <- xy[,"x"] ; y <- xy[,"y"]
a2. <- atan2(y,x)

stopifnot(identical(which.min(m0), integer(0)),
	  identical(which.max(m0), integer(0)),
          all.equal(a2., atan2(as(y,"mpfr"), x)),
	  max(m0) == mpfr(-Inf, 53), # (53 is not a feature, but ok)
	  min(m0) == mpfr(+Inf, 53),
	  sum(m0) == 0, prod(m0) == 1)



