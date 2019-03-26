library(nlsr)


### Name: dex
### Title: Calculate expression for derivative calculations.
### Aliases: dex

### ** Examples

aa <- dex(~ x^2)
aa
str(aa)
bb <- dex(expression(x^2))
bb
str(bb)
cc <- dex("x^2")
cc
str(cc)



