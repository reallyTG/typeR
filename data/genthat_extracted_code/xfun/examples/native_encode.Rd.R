library(xfun)


### Name: native_encode
### Title: Try to use the system native encoding to represent a character
###   vector
### Aliases: native_encode

### ** Examples

library(xfun)
s = intToUtf8(c(20320, 22909))
Encoding(s)

s2 = native_encode(s)
Encoding(s2)



