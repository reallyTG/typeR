library(sfsmisc)


### Name: signi
### Title: Rounding to Significant Digits
### Aliases: signi
### Keywords: arith

### ** Examples

(x1 <- seq(-2, 4, by = 0.5))
identical(x1, signi(x1))# since 0.5 is exact in binary arithmetic
(x2 <- pi - 3 + c(-5,-1,0, .1, .2, 1, 10,100))
signi(x2, 3)



