library(gamlss.nl)


### Name: finterp
### Title: Formula Interpreter
### Aliases: finterp finterp.data.frame finterp.default fmobj
### Keywords: regression

### ** Examples

# From Jim Lindsey
x1 <- rpois(20,2)
x2 <- rnorm(20)
#
# Wilkinson and Rogers formula with three parameters
fn1 <- finterp(~x1+x2)
fn1
fn1(rep(2,3))
# the same formula with unknowns
fn2 <- finterp(~b0+b1*x1+b2*x2)
fn2
fn2(rep(2,3))
#
# nonlinear formulae with unknowns
# log link
fn2a <- finterp(~exp(b0+b1*x1+b2*x2))
fn2a
fn2a(rep(0.2,3))
# parameters common to two functions
fn2b <- finterp(~c0+c1*exp(b0+b1*x1+b2*x2), .old=fn2a, .start=4)
fn2b
# function returned also depends on values of another function
fn2c <- finterp(~fn2+c1*exp(b0+b1*x1+b2*x2), .old=fn2a,
        .start=4, .args="fn2")
fn2c
args(fn2c)
fn2c(rep(0.2,4),fn2(rep(2,3)))
#
# compartment model
times <- 1:20
# exp() parameters to ensure that they are positive
fn3 <- finterp(~exp(absorption-volume)/(exp(absorption)-
        exp(elimination))*(exp(-exp(elimination)*times)-
        exp(-exp(absorption)*times)))
fn3
fn3(log(c(0.3,3,0.2)))
# a more efficient way
# (note that parameters do not appear in the same order)
form <- ~{
        ka <- exp(absorption)
        ke <- exp(elimination)
        ka*exp(-volume)/(ka-ke)*(exp(-ke*times)-exp(-ka*times))}
fn3a <- finterp(form)
fn3a(log(c(0.3,0.2,3)))
#
# Poisson density
y <- rpois(20,5)
fn4 <- finterp(~mu^y*exp(-mu)/gamma(y+1))
fn4
fn4(5)
dpois(y,5)
#
# Poisson likelihood
# mean parameter
fn5 <- finterp(~-y*log(mu)+mu+lgamma(y+1),.vector=FALSE)
fn5
likefn1 <- function(p) sum(fn5(mu=p))
nlm(likefn1,p=1)
mean(y)
# canonical parameter
fn5a <- finterp(~-y*theta+exp(theta)+lgamma(y+1),.vector=FALSE)
fn5a
likefn1a <- function(p) sum(fn5a(theta=p))
nlm(likefn1a,p=1)
#
# likelihood for Poisson log linear regression
y <- rpois(20,fn2a(c(0.2,1,0.4)))
nlm(likefn1,p=1)
mean(y)
likefn2 <- function(p) sum(fn5(mu=fn2a(p)))
nlm(likefn2,p=c(1,0,0))
# or
likefn2a <- function(p) sum(fn5a(theta=fn2(p)))
nlm(likefn2a,p=c(1,0,0))
#
# likelihood for Poisson nonlinear regression
y <- rpois(20,fn3(log(c(3,0.3,0.2))))
nlm(likefn1,p=1)
mean(y)
likefn3 <- function(p) sum(fn5(mu=fn3(p)))
nlm(likefn3,p=log(c(1,0.4,0.1)))
#
# envir as data objects
# y <- matrix(rnorm(20),ncol=5)
#y[3,3] <- y[2,2] <- NA
#x1 <- 1:4
#x2 <- c("a","b","c","d")
#resp <- restovec(y)
#xx <- tcctomat(x1)
#xx2 <- tcctomat(data.frame(x1,x2))
#z1 <- matrix(rnorm(20),ncol=5)
#z2 <- matrix(rnorm(20),ncol=5)
#z3 <- matrix(rnorm(20),ncol=5)
#zz <- tvctomat(z1)
#zz <- tvctomat(z2,old=zz)
#reps <- rmna(resp, ccov=xx, tvcov=zz)
#reps2 <- rmna(resp, ccov=xx2, tvcov=zz)
#rm(y, x1, x2 , z1, z2)
#
# repeated objects
#
# time-constant covariates
# Wilkinson and Rogers notation
#form1 <- ~x1
#print(fn1 <- finterp(form1, .envir=reps))
#fn1(2:3)
#print(fn1a <- finterp(form1, .envir=xx))
#fn1a(2:3)
#form1b <- ~x1+x2
#print(fn1b <- finterp(form1b, .envir=reps2))
#fn1b(2:6)
#print(fn1c <- finterp(form1b, .envir=xx2))
#fn1c(2:6)
# with unknown parameters
#form2 <- ~a+b*x1
#print(fn2 <- finterp(form2, .envir=reps))
#fn2(2:3)
#print(fn2a <- finterp(form2, .envir=xx))
#fn2a(2:3)
#
# time-varying covariates
# Wilkinson and Rogers notation
#form3 <- ~z1+z2
#print(fn3 <- finterp(form3, .envir=reps))
#fn3(2:4)
#print(fn3a <- finterp(form3, .envir=zz))
#fn3a(2:4)
# with unknown parameters
#form4 <- ~a+b*z1+c*z2
#print(fn4 <- finterp(form4, .envir=reps))
#fn4(2:4)
#print(fn4a <- finterp(form4, .envir=zz))
#fn4a(2:4)
#
# note: lengths of x1 and z2 differ
# Wilkinson and Rogers notation
#form5 <- ~x1+z2                
#print(fn5 <- finterp(form5, .envir=reps))
#fn5(2:4)
# with unknown parameters
#form6 <- ~a+b*x1+c*z2
#print(fn6 <- finterp(form6, .envir=reps))
#fn6(2:4)
#
# with times
# Wilkinson and Rogers notation
#form7 <- ~x1+z2+times
#print(fn7 <- finterp(form7, .envir=reps))
#fn7(2:5)
#form7a <- ~x1+x2+z2+times
#print(fn7a <- finterp(form7a, .envir=reps2))
#fn7a(2:8)
# with unknown parameters
#form8 <- ~a+b*x1+c*z2+e*times
#print(fn8 <- finterp(form8, .envir=reps))
#fn8(2:5)
#
# with a variable not in the data object
#form9 <- ~a+b*z1+c*z2+e*z3
#print(fn9 <- finterp(form9, .envir=reps))
#fn9(2:5)
# z3 assumed to be an unknown parameter:
#fn9(2:6)
#
# multiline formula
#form10 <- ~{
#        tmp <- exp(b)
#        a+tmp*z1+c*z2+d*times}
#print(fn10 <- finterp(form10, .envir=reps))
#fn10(2:5)
# for fmobj
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



