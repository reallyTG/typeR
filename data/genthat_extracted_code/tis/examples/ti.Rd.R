library(tis)


### Name: ti
### Title: Time Index Objects
### Aliases: ti ti.Date ti.default ti.jul ti.ssDate ti.ti ti.tis ti.yearmon
###   ti.yearqtr as.ti asTi couldBeTi is.ti
### Keywords: chron ts

### ** Examples

z <- ti(19971231, "monthly")   ##  monthly ti for Dec 97
is.ti(z)                       ##  TRUE
is.ti(unclass(z))              ##  FALSE
couldBeTi(unclass(z))          ##  TRUE
ymd(z + 4)                     ##  19980430
z - ti(c(1997,6), freq = 12)   ##  monthly ti for June 1997
ti(z, tif = "wmonday")         ##  week ending Monday June 30, 1997



