library(zoo)


### Name: is.regular
### Title: Check Regularity of a Series
### Aliases: is.regular is.regular.zoo is.regular.ts is.regular.zooreg
###   is.regular.default
### Keywords: ts

### ** Examples

## checking of a strictly regular zoo series
z <- zoo(1:10, seq(2000, 2002.25, by = 0.25), frequency = 4)
z
class(z)
frequency(z) ## extraction of frequency attribute
is.regular(z)
is.regular(z, strict = TRUE)
## by omitting observations, the series is not strictly regular
is.regular(z[-3])
is.regular(z[-3], strict = TRUE)

## checking of a plain zoo series without frequency attribute
## which is in fact regular
z <- zoo(1:10, seq(2000, 2002.25, by = 0.25))
z
class(z)
frequency(z) ## data driven computation of frequency
is.regular(z)
is.regular(z, strict = TRUE)
## by omitting observations, the series is not strictly regular
is.regular(z[-3])
is.regular(z[-3], strict = TRUE)

## checking of an irregular zoo series
z <- zoo(1:10, rnorm(10))
z
class(z)
frequency(z) ## attempt of data-driven frequency computation
is.regular(z)
is.regular(z, strict = TRUE)



