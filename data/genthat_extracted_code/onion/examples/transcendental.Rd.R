library(onion)


### Name: exp
### Title: Elementary transcendental functions
### Aliases: exp log ln sin cos tan asin acos atan sinh cosh tanh asinh
###   acosh atanh sqrt exp.octonion log.octonion ln.octonion sin.octonion
###   cos.octonion tan.octonion asin.octonion acos.octonion atan.octonion
###   sinh.octonion cosh.octonion tanh.octonion asinh.octonion
###   acosh.octonion atanh.octonion sqrt.octonion exp.onion log.onion
###   ln.onion sin.onion cos.onion tan.onion asin.onion acos.onion
###   atan.onion sinh.onion cosh.onion tanh.onion asinh.onion acosh.onion
###   atanh.onion sqrt.onion
### Keywords: array

### ** Examples

x <- roct(3)/10
sin(x)^2 + cos(x)^2  #should be close to O1

a <- rquat(5)
b <- roct(5)

log(a*b) -log(a) -log(b)  #zero for real or complex a & b, but not quaternions
log(b*a) -log(a) -log(b)  #different (and still nonzero)



