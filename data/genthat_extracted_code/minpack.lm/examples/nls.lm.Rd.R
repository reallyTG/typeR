library(minpack.lm)


### Name: nls.lm
### Title: Addresses NLS problems with the Levenberg-Marquardt algorithm
### Aliases: nls.lm
### Keywords: nonlinear optimize regression

### ** Examples


###### example 1

## values over which to simulate data 
x <- seq(0,5,length=100)

## model based on a list of parameters 
getPred <- function(parS, xx) parS$a * exp(xx * parS$b) + parS$c 

## parameter values used to simulate data
pp <- list(a=9,b=-1, c=6) 

## simulated data, with noise  
simDNoisy <- getPred(pp,x) + rnorm(length(x),sd=.1)
 
## plot data
plot(x,simDNoisy, main="data")

## residual function 
residFun <- function(p, observed, xx) observed - getPred(p,xx)

## starting values for parameters  
parStart <- list(a=3,b=-.001, c=1)

## perform fit 
nls.out <- nls.lm(par=parStart, fn = residFun, observed = simDNoisy,
xx = x, control = nls.lm.control(nprint=1))

## plot model evaluated at final parameter estimates  
lines(x,getPred(as.list(coef(nls.out)), x), col=2, lwd=2)

## summary information on parameter estimates
summary(nls.out) 

###### example 2 

## function to simulate data 
f <- function(TT, tau, N0, a, f0) {
    expr <- expression(N0*exp(-TT/tau)*(1 + a*cos(f0*TT)))
    eval(expr)
}

## helper function for an analytical gradient 
j <- function(TT, tau, N0, a, f0) {
    expr <- expression(N0*exp(-TT/tau)*(1 + a*cos(f0*TT)))
    c(eval(D(expr, "tau")), eval(D(expr, "N0" )),
      eval(D(expr, "a"  )), eval(D(expr, "f0" )))
}

## values over which to simulate data 
TT <- seq(0, 8, length=501)

## parameter values underlying simulated data  
p <- c(tau = 2.2, N0 = 1000, a = 0.25, f0 = 8)

## get data 
Ndet <- do.call("f", c(list(TT = TT), as.list(p)))
## with noise
N <- Ndet +  rnorm(length(Ndet), mean=Ndet, sd=.01*max(Ndet))

## plot the data to fit
par(mfrow=c(2,1), mar = c(3,5,2,1))  
plot(TT, N, bg = "black", cex = 0.5, main="data")

## define a residual function 
fcn     <- function(p, TT, N, fcall, jcall)
    (N - do.call("fcall", c(list(TT = TT), as.list(p))))

## define analytical expression for the gradient 
fcn.jac <- function(p, TT, N, fcall, jcall) 
    -do.call("jcall", c(list(TT = TT), as.list(p)))

## starting values 
guess <- c(tau = 2.2, N0 = 1500, a = 0.25, f0 = 10)

## to use an analytical expression for the gradient found in fcn.jac
## uncomment jac = fcn.jac
out <- nls.lm(par = guess, fn = fcn, jac = fcn.jac,
              fcall = f, jcall = j,
              TT = TT, N = N, control = nls.lm.control(nprint=1))

## get the fitted values 
N1 <- do.call("f", c(list(TT = TT), out$par))   

## add a blue line representing the fitting values to the plot of data 
lines(TT, N1, col="blue", lwd=2)

## add a plot of the log residual sum of squares as it is made to
## decrease each iteration; note that the RSS at the starting parameter
## values is also stored
plot(1:(out$niter+1), log(out$rsstrace), type="b",
main="log residual sum of squares vs. iteration number",
xlab="iteration", ylab="log residual sum of squares", pch=21,bg=2) 

## get information regarding standard errors
summary(out) 




