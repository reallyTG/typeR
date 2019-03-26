library(zoo)


### Name: na.fill
### Title: Fill NA or specified positions.
### Aliases: na.fill na.fill0 na.fill.ts na.fill.zoo na.fill.default
### Keywords: ts

### ** Examples


z <- zoo(c(NA, 2, NA, 1, 4, 5, 2, NA))
na.fill(z, "extend")
na.fill(z, c("extend", NA))
na.fill(z, -(1:3))
na.fill(z, list(NA, NULL, NA))




