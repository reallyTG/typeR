library(VeryLargeIntegers)


### Name: 04. Logarithms
### Title: Integer Logarithms for vli Objects
### Aliases: '04. Logarithms' log10.vli log10rem log10rem.default
###   log10rem.numeric log10rem.vli log.vli logrem logrem.default
###   logrem.numeric logrem.vli loge loge.default loge.numeric loge.vli

### ** Examples

x <- as.vli("3873899469432")
log(x, base = 5)
logrem(x, base = 5)
( 5^log(x, base = 5) ) + logrem(x, base = 5) == x
x <- as.vli("149234629386497858748773210293261249785")
log10(x)



