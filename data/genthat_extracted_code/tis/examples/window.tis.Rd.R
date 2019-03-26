library(tis)


### Name: window.tis
### Title: Time windows for Time Indexed Series
### Aliases: window.tis
### Keywords: ts

### ** Examples

z <- tis(1:24, start = c(2001,1), freq = 12)
z2 <- window(z, start = 19991231, extend = TRUE) ## z2 extends back with NA's
window(z, end = end(z) - 3)



