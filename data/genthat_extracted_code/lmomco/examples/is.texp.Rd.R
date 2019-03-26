library(lmomco)


### Name: is.texp
### Title: Is a Distribution Parameter Object Typed as Truncated
###   Exponential
### Aliases: is.texp
### Keywords: utility (distribution, type check) Distribution: Exponential
###   (trimmed)

### ** Examples

yy <- vec2par(c(123, 2.3, TRUE),  type="texp")
zz <- vec2par(c(123, 2.3, FALSE), type="texp")
if(is.texp(yy) & is.texp(zz)) {
   print(lmomtexp(yy)$lambdas)
   print(lmomtexp(zz)$lambdas)
}



