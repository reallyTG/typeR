library(repeated)


### Name: gnlmm3
### Title: Generalized Nonlinear Mixed Models for Three-parameter
###   Distributions
### Aliases: gnlmm3
### Keywords: models

### ** Examples


# data objects
sex <- c(0,1,1)
sx <- tcctomat(sex)
#dose <- matrix(rpois(30,10),nrow=3)
dose <- matrix(c(8,9,11,9,11,11,7,8,7,12,8,8,9,10,15,10,9,9,20,14,4,7,
	4,13,10,13,6,13,11,17),nrow=3)
dd <- tvctomat(dose)
# vectors for functions
dose <- as.vector(t(dose))
sex <- c(rep(0,10),rep(1,20))
nest <- rbind(rep(1,10),rep(2,10),rep(3,10))
#y <- (rt(30,5)+exp(0.2+0.3*dose+0.5*sex+rep(rnorm(3),rep(10,3))))*3
y <- c(62.39712552,196.94419614,2224.74940087,269.56691601,12.86079662,
	14.96743546, 47.45765042,156.51381687,508.68804438,281.11065302,
	92.32443655, 81.88000484, 40.26357733, 13.04433670, 15.58490237,
	63.62154867, 23.69677549, 53.52885894, 88.02507682, 34.04302506,
	44.28232323,116.80732423,106.72564484, 25.09749055, 12.61839145,
	-0.04060996,153.32670123, 63.25866087, 17.79852591,930.52558064)
y <- restovec(matrix(y, nrow=3), nest=nest, name="y")
reps <- rmna(y, ccov=sx, tvcov=dd)
#
# log linear regression with Student t distribution
mu <- function(p) exp(p[1]+p[2]*sex+p[3]*dose)
## print(z <- gnlm::gnlr3(y, dist="Student", mu=mu, pmu=c(0,0,0), pshape=1, pfamily=1))
## starting values for pmu and pshape from z$coef[1:3] and z$coef[4] respectively
## starting value for pfamily in z$coef[5]
gnlmm3(y, dist="Student", mu=mu, nest=nest, pmu=c(3.69,-1.19, 0.039),
	pshape=4.94, pfamily=-0.6887259, psd=50, points=3)
# or equivalently
gnlmm3(y, dist="Student", mu=~exp(b0+b1*sex+b2*dose), nest=nest,
	pmu=c(3.69,-1.19, 0.039), pshape=4.94, pfamily=-0.6887259, psd=50,
	points=3, envir=reps)
## Not run: 
##D # or with identity link
##D print(z <- gnlm::gnlr3(y, dist="Student", mu=~sex+dose, pmu=c(0.1,0,0), pshape=1,
##D 	pfamily=1))
##D gnlmm3(y, dist="Student", mu=~sex+dose, nest=nest, pmu=z$coef[1:3],
##D 	pshape=z$coef[4], pfamily=z$coef[5], psd=50, points=3)
##D # or
##D gnlmm3(y, dist="Student", mu=~b0+b1*sex+b2*dose, nest=nest, pmu=z$coef[1:3],
##D 	pshape=z$coef[4], pfamily=z$coef[5], psd=50, points=3, envir=reps)
##D #
##D # nonlinear regression with Student t distribution
##D mu <- function(p) p[1]+exp(p[2]+p[3]*sex+p[4]*dose)
##D print(z <- gnlm::gnlr3(y, dist="Student", mu=mu, pmu=c(1,1,0,0), pshape=1,
##D 	pfamily=1))
##D gnlmm3(y, dist="Student", mu=mu, nest=nest, pmu=z$coef[1:4],
##D 	pshape=z$coef[5], pfamily=z$coef[6], psd=50, points=3)
##D # or
##D mu2 <- function(p, linear) p[1]+exp(linear)
##D gnlmm3(y, dist="Student", mu=mu2, linear=~sex+dose, nest=nest,
##D 	pmu=z$coef[1:4], pshape=z$coef[5], pfamily=z$coef[6], psd=50,
##D 	points=3)
##D # or
##D gnlmm3(y, dist="Student", mu=~a+exp(linear), linear=~sex+dose, nest=nest,
##D 	pmu=z$coef[1:4], pshape=z$coef[5], pfamily=z$coef[6], psd=50,
##D 	points=3)
##D # or
##D gnlmm3(y, dist="Student", mu=~b4+exp(b0+b1*sex+b2*dose), nest=nest,
##D 	pmu=z$coef[1:4], pshape=z$coef[5], pfamily=z$coef[6], psd=50,
##D 	points=3, envir=reps)
##D #
##D # include regression for the shape parameter with same mu function
##D shape <- function(p) p[1]+p[2]*sex
##D print(z <- gnlm::gnlr3(y, dist="Student", mu=mu, shape=shape, pmu=z$coef[1:4],
##D 	pshape=c(z$coef[5],0), pfamily=z$coef[6]))
##D gnlmm3(y, dist="Student", mu=mu, shape=shape, nest=nest,
##D 	pmu=z$coef[1:4], pshape=z$coef[5:6], pfamily=z$coef[7],
##D 	psd=5, points=3)
##D # or
##D gnlmm3(y, dist="Student", mu=mu, shape=shape, nest=nest, pmu=z$coef[1:4],
##D 	pshape=z$coef[5:6], pfamily=z$coef[7], psd=5, points=3,
##D 	envir=reps)
##D # or
##D gnlmm3(y, dist="Student", mu=~b4+exp(b0+b1*sex+b2*dose), shape=~a1+a2*sex,
##D 	nest=nest, pmu=z$coef[1:4], pshape=z$coef[5:6],
##D 	pfamily=z$coef[7], psd=5, points=3, envir=reps)
## End(Not run)



