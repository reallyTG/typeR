library(fda)


### Name: exponentiate.fd
### Title: Powers of a functional data ('fd') object
### Aliases: exponentiate.fd ^.fd
### Keywords: smooth

### ** Examples

##
## sin^2
##

basis3 <- create.fourier.basis(nbasis=3)
plot(basis3)
# max = sqrt(2), so
# integral of the square of each basis function (from 0 to 1) is 1
integrate(function(x)sin(2*pi*x)^2, 0, 1) # = 0.5

# sin(theta)
fdsin <- fd(c(0,sqrt(0.5),0), basis3)
plot(fdsin)

fdsin2 <- fdsin^2

# check
fdsinsin <- fdsin*fdsin
# sin^2(pi*time) = 0.5*(1-cos(2*pi*theta) basic trig identity
plot(fdsinsin) # good

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(fdsin2, fdsinsin)
## Don't show: 
)
## End(Don't show)

##
## sqrt(sin2)
##
plot(fdsin2)
fdsin. <- sqrt(fdsin2)
plot(fdsin, main='fdsin and sqrt(fdsin^2)')
lines(fdsin., col='red')
# fdsin is positive and negative
# fdsin. = sqrt(fdsin^2)
# has trouble, because it wants to be smooth
# but theoretically has a discontinuous first derivative at 0.5

fdsin.5.2 <- fdsin.^2
resin <- fdsin2-fdsin.5.2
plot(resin)
## Don't show: 
stopifnot(
## End(Don't show)
max(abs(resin$coefs))<0.01
## Don't show: 
)
## End(Don't show)

##
## x^2, x = straight line f(x)=x
##
bspl1 <- create.bspline.basis(norder=2)
x <- fd(0:1, bspl1)
plot(x)

x2 <- x^2
plot(x2)

er.x <- x-sqrt(x2)
er.x$coefs
max(er.x$coefs)
## Don't show: 
stopifnot(
## End(Don't show)
max(abs(er.x$coefs))<10*.Machine$double.eps
## Don't show: 
)
## End(Don't show)




