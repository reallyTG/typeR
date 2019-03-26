library(pracma)


### Name: gaussHermite
### Title: Gauss-Hermite Quadrature Formula
### Aliases: gaussHermite
### Keywords: math

### ** Examples

cc <- gaussHermite(17)
# Integrate  exp(-x^2)  from -Inf to Inf
sum(cc$w)                        #=> 1.77245385090552 == sqrt(pi)
# Integrate  x^2 exp(-x^2)
sum(cc$w * cc$x^2)               #=> 0.88622692545276 == sqrt(pi) /2
# Integrate  cos(x) * exp(-x^2)
sum(cc$w * cos(cc$x))            #=> 1.38038844704314 == sqrt(pi)/exp(1)^0.25



