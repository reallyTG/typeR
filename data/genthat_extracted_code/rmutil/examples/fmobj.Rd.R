library(rmutil)


### Name: fmobj
### Title: Object Finder
### Aliases: fmobj
### Keywords: programming

### ** Examples

x1 <- rpois(20,2)
x2 <- rnorm(20)
x3 <- gl(2,10)
#
# W&R formula
fmobj(~x1+x2+x3)
#
# formula with unknowns
fmobj(~b0+b1*x1+b2*x2)
#
# nonlinear formulae with unknowns
# log link
fmobj(~exp(b0+b1*x1+b2*x2))



