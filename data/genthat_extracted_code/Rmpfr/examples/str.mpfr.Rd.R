library(Rmpfr)


### Name: str.mpfr
### Title: Compactly Show STRucture of Rmpfr Number Object
### Aliases: str.mpfr
### Keywords: utilities

### ** Examples

(x <- c(Const("pi", 64), mpfr(-2:2, 64)))
str(x)
str(list(pi = pi, x.mpfr = x))
str(x ^ 1000)
str(x ^ -1e4, digits=NULL) # full precision

str(x, internal = TRUE) # internal low-level (for experts)

uu <- Const("pi", 16)# unaccurate
str(uu) # not using default of 12 digits



