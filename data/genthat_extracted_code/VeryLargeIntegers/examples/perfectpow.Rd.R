library(VeryLargeIntegers)


### Name: 12. Perfect power
### Title: Perfect Power Tools for vli Objects
### Aliases: '12. Perfect power' perfectpow perfectpow.default
###   perfectpow.numeric perfectpow.vli is.perfectpow is.perfectpow.default
###   is.perfectpow.numeric is.perfectpow.vli

### ** Examples

x <- as.vli("234925792")
is.perfectpow(x)

x <- as.vli("77808066022325383192121677734375")
is.perfectpow(x)
res <- perfectpow(x)
res
res[[1]]^res[[2]]



