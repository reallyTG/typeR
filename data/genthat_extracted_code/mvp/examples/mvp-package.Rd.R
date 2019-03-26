library(mvp)


### Name: mvp-package
### Title: Fast Symbolic Multivariate Polynomials
### Aliases: mvp-package
### Keywords: package

### ** Examples

p <- as.mvp("1+x+x*y+x^5")

p + as.mvp("a+b^6")

p^3

subs(p^4,x="a+b^2")
aderiv(p^2,x=4)
horner(p,1:3)










