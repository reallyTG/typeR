library(rmutil)


### Name: fnenvir
### Title: Check Covariates and Parameters of a Function
### Aliases: fnenvir fnenvir.data.frame fnenvir.default fnenvir.repeated
###   fnenvir.tccov fnenvir.tvcov
### Keywords: programming

### ** Examples

fn <- function(p) a+b*x
fnenvir(fn)
fn <- function(p) a+p*x
fnenvir(fn)
x <- 1:4
fnenvir(fn)
fn <- function(p) p[1]+exp(p[2]*x)
fnenvir(fn)
#
y <- matrix(rnorm(20),ncol=5)
y[3,3] <- y[2,2] <- NA
resp <- restovec(y)
xx <- tcctomat(x)
z1 <- matrix(rnorm(20),ncol=5)
z2 <- matrix(rnorm(20),ncol=5)
z3 <- matrix(rnorm(20),ncol=5)
zz <- tvctomat(z1)
zz <- tvctomat(z2,old=zz)
reps <- rmna(resp, ccov=xx, tvcov=zz)
rm(y, x, z1, z2)
#
# repeated objects
func1 <- function(p) p[1]+p[2]*x+p[3]*z2
print(fn1 <- fnenvir(func1, .envir=reps))
fn1(2:4)
#
# time-constant covariates
func2 <- function(p) p[1]+p[2]*x
print(fn2 <- fnenvir(func2, .envir=reps))
fn2(2:3)
print(fn2a <- fnenvir(func2, .envir=xx))
fn2a(2:3)
#
# time-varying covariates
func3 <- function(p) p[1]+p[2]*z1+p[3]*z2
print(fn3 <- fnenvir(func3, .envir=reps))
fn3(2:4)
print(fn3a <- fnenvir(func3, .envir=zz))
fn3a(2:4)
# including times
func3b <- function(p) p[1]+p[2]*z1+p[3]*z2+p[4]*times
print(fn3b <- fnenvir(func3b, .envir=reps))
fn3b(2:5)
#
# with typing error and a variable not in the data object
func4 <- function(p) p[1]+p2[2]*z1+p[3]*z2+p[4]*z3
print(fn4 <- fnenvir(func4, .envir=reps))
#
# first-order one-compartment model
# data objects for formulae
dose <- c(2,5)
dd <- tcctomat(dose)
times <- matrix(rep(1:20,2), nrow=2, byrow=TRUE)
tt <- tvctomat(times)
# vector covariates for functions
dose <- c(rep(2,20),rep(5,20))
times <- rep(1:20,2)
# functions
mu <- function(p) {
	absorption <- exp(p[1])
	elimination <- exp(p[2])
	absorption*exp(-p[3])*dose/(absorption-elimination)*
		(exp(-elimination*times)-exp(-absorption*times))}
shape <- function(p) exp(p[1]-p[2])*times*dose*exp(-exp(p[1])*times)
# response
conc <- matrix(rgamma(40,shape(log(c(0.1,0.4))),
	scale=mu(log(c(1,0.3,0.2))))/shape(log(c(0.1,0.4))),ncol=20,byrow=TRUE)
conc[,2:20] <- conc[,2:20]+0.5*(conc[,1:19]-matrix(mu(log(c(1,0.3,0.2))),
	ncol=20,byrow=TRUE)[,1:19])
conc <- restovec(ifelse(conc>0,conc,0.01))
reps <- rmna(conc, ccov=dd, tvcov=tt)
#
print(fn5 <- fnenvir(mu,.envir=reps))
fn5(c(0,-1.2,-1.6))



