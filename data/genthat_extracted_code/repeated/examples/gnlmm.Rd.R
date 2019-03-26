library(repeated)


### Name: gnlmm
### Title: Generalized Nonlinear Mixed Models
### Aliases: gnlmm
### Keywords: models

### ** Examples


# data objects
sex <- c(0,1,1)
sx <- tcctomat(sex)
dose <- matrix(rpois(30,10),nrow=3)
dd <- tvctomat(dose)
# vectors for functions
dose <- as.vector(t(dose))
sex <- c(rep(0,10),rep(1,20))
nest <- rbind(rep(1,10),rep(2,10),rep(3,10))
#y <- rgamma(30,2,scale=exp(0.2+0.1*dose+0.1*sex+rep(rnorm(3),rep(10,3)))/2)
y <- c(0.6490851,0.9313931,0.4765569,0.4188045,2.8339637,2.8158090,
	2.6059975,2.9958184,2.7351583,3.2884980,1.1180961,0.9443986,1.7915571,
	9.0013379,2.3969570,3.4227356,0.5045518,0.7452521,1.8712467,3.6814198,
	0.1489849,1.0327552,0.6102406,1.1536620,2.9145237,9.2847798,5.6454605,
	1.9759672,1.5798008,5.1024496)
y <- restovec(matrix(y, nrow=3), nest=nest, name="y")
reps <- rmna(y, ccov=sx, tvcov=dd)
#
# log linear regression with gamma distribution
mu <- function(p) exp(p[1]+p[2]*sex+p[3]*dose)
## print(z <- gnlm::gnlr(y, dist="gamma", mu=mu, pmu=c(1,0,0), pshape=1))
## starting values for pmu and pshape from z$coef[1:3] and z$coef[4] respectively
gnlmm(y, dist="gamma", mu=mu, nest=nest, pmu=c(1.101,0.326,-0.045),
     pshape=0.391, psd=0.1, points=3)
# or equivalently
gnlmm(y, dist="gamma", mu=~exp(b0+b1*sex+b2*dose), nest=nest,
     pmu=c(1.101,0.326,-0.045), pshape=0.391, psd=0.1, points=3, envir=reps)
## Not run: 
##D # or with identity link
##D print(z <- gnlm::gnlr(y, dist="gamma", mu=~sex+dose, pmu=c(0.1,0,0), pshape=1))
##D gnlmm(y, dist="gamma", mu=~sex+dose, nest=nest, pmu=z$coef[1:3],
##D 	pshape=z$coef[4], psd=0.1, points=3)
##D # or
##D gnlmm(y, dist="gamma", mu=~b0+b1*sex+b2*dose, nest=nest, pmu=z$coef[1:3],
##D 	pshape=z$coef[4], psd=0.1, points=3, envir=reps)
##D #
##D # nonlinear regression with gamma distribution
##D mu <- function(p) p[1]+exp(p[2]+p[3]*sex+p[4]*dose)
##D print(z <- gnlm::gnlr(y, dist="gamma", mu=mu, pmu=c(1,1,0,0), pshape=1))
##D gnlmm(y, dist="gamma", mu=mu, nest=nest, pmu=z$coef[1:4],
##D 	pshape=z$coef[5], psd=0.1, points=3)
##D # or
##D mu2 <- function(p, linear) p[1]+exp(linear)
##D gnlmm(y, dist="gamma", mu=mu2, linear=~sex+dose, nest=nest,
##D 	pmu=z$coef[1:4], pshape=1, psd=0.1, points=3)
##D # or
##D gnlmm(y, dist="gamma", mu=~a+exp(linear), linear=~sex+dose, nest=nest,
##D 	pmu=z$coef[1:4], pshape=1, psd=0.1, points=3)
##D # or
##D gnlmm(y, dist="gamma", mu=~b4+exp(b0+b1*sex+b2*dose), nest=nest,
##D 	pmu=z$coef[1:4], pshape=z$coef[5], psd=0.1,
##D 	points=3, envir=reps)
##D #
##D # include regression for the shape parameter with same mu function
##D shape <- function(p) p[1]+p[2]*sex
##D print(z <- gnlm::gnlr(y, dist="gamma", mu=mu, shape=shape, pmu=z$coef[1:4],
##D 	pshape=rep(1,2)))
##D gnlmm(y, dist="gamma", mu=mu, shape=shape, nest=nest,
##D 	pmu=z$coef[1:4], pshape=z$coef[5:6], psd=0.1, points=3)
##D # or
##D gnlmm(y, dist="gamma", mu=mu, shape=shape, nest=nest, pmu=z$coef[1:4],
##D 	pshape=z$coef[5:6], psd=0.1, points=3, envir=reps)
##D # or
##D gnlmm(y, dist="gamma", mu=~b4+exp(b0+b1*sex+b2*dose), shape=~a1+a2*sex,
##D 	nest=nest, pmu=z$coef[1:4], pshape=z$coef[5:6], psd=0.1,
##D 	points=3, envir=reps)
## End(Not run)



