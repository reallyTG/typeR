library(polyCub)


### Name: polyCub.iso
### Title: Cubature of Isotropic Functions over Polygonal Domains
### Aliases: polyCub.iso .polyCub.iso
### Keywords: math spatial

### ** Examples

## we use the example polygon and f (exponential decay) from
example(plotpolyf)

## numerical approximation of 'intrfr' (not recommended)
(intISOnum <- polyCub.iso(letterR, f, center = fcenter))

## analytical 'intrfr'
## intrfr(R) = int_0^R r*f(r) dr, for f(r) = dexp(r), gives
intrfr <- function (R, rate = 1) pgamma(R, 2, rate) / rate
(intISOana <- polyCub.iso(letterR, f, intrfr = intrfr, center = fcenter,
                          check.intrfr = TRUE))
## f is only used to check 'intrfr' against a numerical approximation

stopifnot(all.equal(intISOana, intISOnum, check.attributes = FALSE))


### polygon area: f(r) = 1, f(x,y) = 1, center does not really matter

## intrfr(R) = int_0^R r*f(r) dr = int_0^R r dr = R^2/2
intrfr.const <- function (R) R^2/2
(area.ISO <- polyCub.iso(letterR, intrfr = intrfr.const, center = c(0,0)))

if (require("spatstat")) { # check against area.owin()
    stopifnot(all.equal(area.owin(owin(poly = letterR)),
                        area.ISO, check.attributes = FALSE))
}



