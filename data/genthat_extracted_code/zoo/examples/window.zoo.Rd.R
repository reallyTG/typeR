library(zoo)


### Name: window.zoo
### Title: Extract/Replacing the Time Windows of Objects
### Aliases: window.zoo window<-.zoo
### Keywords: ts

### ** Examples

## zoo example
x.date <- as.Date(paste(2003, rep(1:4, 4:1), seq(1,19,2), sep = "-"))
x <- zoo(matrix(rnorm(20), ncol = 2), x.date)
x

window(x, start = as.Date("2003-02-01"), end = as.Date("2003-03-01"))
window(x, index = x.date[1:6], start = as.Date("2003-02-01"))
window(x, index = x.date[c(4, 8, 10)])
window(x, index = x.date[c(4, 8, 10)]) <- matrix(1:6, ncol = 2)
x

## for classes that support comparisons with "character" variables
## start and end may be "character".
window(x, start = "2003-02-01")

## zooreg example (with plain numeric index)
z <- zooreg(rnorm(10), start = 2000, freq = 4)
window(z, start = 2001.75)
window(z, start = c(2001, 4))

## replace data at times of d0 which are in dn
d1 <- d0 <- zoo(1:10) + 100
dn <- - head(d0, 4)
window(d1, time(dn)) <- coredata(dn)

## if the underlying time index is a float, note that the index may
## print in the same way but actually be different (e.g., differing
## by 0.1 second in this example)
zp <- zoo(1:4, as.POSIXct("2000-01-01 00:00:00") + c(-3600, 0, 0.1, 3600))
## and then the >= start and <= end may not select all intended
## observations and adding/subtracting some "fuzz" may be needed
window(zp, end = "2000-01-01 00:00:00")
window(zp, end = as.POSIXct("2000-01-01 00:00:00") + 0.5)



