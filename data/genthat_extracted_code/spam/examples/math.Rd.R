library(spam)


### Name: Math
### Title: Mathematical functions
### Aliases: Math.spam Math,spam-method ceiling.spam ceiling,spam-method
###   floor.spam floor,spam-method trunc.spam trunc,spam-method exp.spam
###   exp,spam-method log.spam log,spam-method log2.spam log2,spam-method
###   log10.spam log10,spam-method sqrt.spam sqrt,spam-method gamma.spam
###   gamma,spam-method digamma.spam digamma,spam-method trigamma.spam
###   trigamma,spam-method lgamma.spam lgamma,spam-method abs.spam
###   abs,spam-method cumprod.spam cumprod,spam-method cumsum.spam
###   cumsum,spam-method cummax.spam cummax,spam-method cummin.spam
###   cummin,spam-method cos.spam cos,spam-method cosh.spam
###   cosh,spam-method acos.spam acos,spam-method acosh.spam
###   acosh,spam-method sin.spam sin,spam-method asin.spam asin,spam-method
###   asinh.spam asinh,spam-method tan.spam tan,spam-method atan.spam
###   atan,spam-method atanh.spam atanh,spam-method
### Keywords: manip

### ** Examples

getGroupMembers("Math")

mat <- matrix(c( 1,2,0,3,0,0,0,4,5),3)
smat <- as.spam( mat)
cos( mat)
cos( smat)

options(spam.structurebased=FALSE)
cos( smat)

sqrt( smat)



