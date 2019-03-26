library(VeryLargeIntegers)


### Name: 03. Roots
### Title: Integer roots for vli Objects
### Aliases: '03. Roots' sqrt.vli sqrtrem sqrtrem.default sqrtrem.numeric
###   sqrtrem.vli rootk rootk.default rootk.numeric rootk.vli rootkrem
###   rootkrem.default rootkrem.numeric rootkrem.vli

### ** Examples

x <- as.vli("4124135")
sqrt(x)
sqrtrem(x)
sqrt(x)^2 + sqrtrem(x) == x
rootk(as.vli("1492346293864978561249785"), 5)



