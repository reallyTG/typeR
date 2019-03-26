library(JWileymisc)


### Name: vainternal
### Title: Internal Visual Acuity Functions
### Aliases: vainternal logmar CFHM snellen
### Keywords: internal

### ** Examples

## logMAR value for "perfect" 20/20 vision
JWileymisc:::logmar(x = 20)

## Go to and from logMAR value, should return "20"
## there may be slight error due to floating point arithmetic
JWileymisc:::logmar(x = JWileymisc:::logmar(x = 20), inverse = TRUE)

## logMAR value for 20/40 vision
JWileymisc:::logmar(40)
## logMAR approximations, note "HM" is just the zero value
JWileymisc:::CFHM(c("HM 20", "HM", "CF 20", "CF 12", "CF"), zero = 3)
## In cases where there is insufficient data, rather than choose
## an arbitrary value, you can may just use NA
JWileymisc:::CFHM(c("HM 20", "HM", "CF 20", "CF 12", "CF"), zero = NA)



