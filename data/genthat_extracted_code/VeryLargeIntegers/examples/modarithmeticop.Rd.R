library(VeryLargeIntegers)


### Name: 08. Modular-arithmetic
### Title: Basic Modular-Arithmetic Operators for vli Objects
### Aliases: '08. Modular-arithmetic' summod summod.default summod.numeric
###   summod.vli submod submod.default submod.numeric submod.vli mulmod
###   mulmod.default mulmod.numeric mulmod.vli powmod powmod.default
###   powmod.numeric powmod.vli invmod invmod.default invmod.numeric
###   invmod.vli divmod divmod.default divmod.numeric divmod.vli

### ** Examples

x <- as.vli("8925378246957826904701")
y <- as.vli("347892325634785693")
mod <- as.vli(21341)

summod(x, y, mod)

mulmod(x, invmod(x, n = 123), mod = 123) == 1

z <- divmod(x, y, mod)
mulmod(z, y, mod) == x %% mod



