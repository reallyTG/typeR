library(fda)


### Name: arithmetic.fd
### Title: Arithmetic on functional data ('fd') objects
### Aliases: arithmetic.fd +.fd plus.fd -.fd minus.fd *.fd times.fd
### Keywords: smooth

### ** Examples

##
## add a parabola to itself
##
bspl4 <- create.bspline.basis(nbasis=4)
parab4.5 <- fd(c(3, -1, -1, 3)/3, bspl4)

coef2 <- matrix(c(6, -2, -2, 6)/3, 4)
dimnames(coef2) <- list(NULL, 'reps 1')
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(coef(parab4.5+parab4.5), coef2)
## Don't show: 
)
## End(Don't show)

##
## Same example with interior knots at 1/3 and 1/2
##
bspl5.3 <- create.bspline.basis(breaks=c(0, 1/3, 1))
plot(bspl5.3)
x. <- seq(0, 1, .1)
para4.5.3 <- smooth.basis(x., 4*(x.-0.5)^2, fdParobj=bspl5.3)[['fd']]
plot(para4.5.3)

bspl5.2 <- create.bspline.basis(breaks=c(0, 1/2, 1))
plot(bspl5.2)
para4.5.2 <- smooth.basis(x., 4*(x.-0.5)^2, fdParobj=bspl5.2)[['fd']]
plot(para4.5.2)

#str(para4.5.3+para4.5.2)

coef2. <- matrix(0, 9, 1)
dimnames(coef2.) <- list(NULL, 'rep1')
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(coef(para4.5.3-para4.5.2), coef2.)
## Don't show: 
)
## End(Don't show)

##
## product
##
quart <- para4.5.3*para4.5.2

# interior knots of the sum
# = union(interior knots of the summands);
# ditto for difference and product.
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(knots(quart), c(knots(para4.5.3), knots(para4.5.2)))
## Don't show: 
)
## End(Don't show)

# norder(quart) = norder(para4.5.2)+norder(para4.5.3)-1 = 7
## Don't show: 
stopifnot(
## End(Don't show)
norder(quart) == (norder(para4.5.2)+norder(para4.5.3)-1)
## Don't show: 
)
## End(Don't show)

# para4.5.2 with knot at 0.5 and para4.5.3 with knot at 1/3
# both have (2 end points + 1 interior knot) + norder-2
#     = 5 basis functions
# quart has (2 end points + 2 interior knots)+norder-2
#     = 9 basis functions
# coefficients look strange because the knots are at
# (1/3, 1/2) and not symmetrical

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(as.numeric(coef(quart)),
0.1*c(90, 50, 14, -10, 6, -2, -2, 30, 90)/9)
## Don't show: 
)
## End(Don't show)

plot(para4.5.3*para4.5.2) # quartic, not parabolic ...

##
## product with Fourier bases
##
f3 <- fd(c(0,0,1), create.fourier.basis())
f3^2 # number of basis functions = 7?

##
## fd+numeric
##
coef1 <- matrix(c(6, 2, 2, 6)/3, 4)
dimnames(coef1) <- list(NULL, 'reps 1')
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(coef(parab4.5+1), coef1)
## Don't show: 
)
## End(Don't show)

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(1+parab4.5, parab4.5+1)
## Don't show: 
)
## End(Don't show)

##
## fd-numeric
##
coefneg <- matrix(c(-3, 1, 1, -3)/3, 4)
dimnames(coefneg) <- list(NULL, 'reps 1')
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(coef(-parab4.5), coefneg)
## Don't show: 
)
## End(Don't show)

plot(parab4.5-1)

plot(1-parab4.5)



