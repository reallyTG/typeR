library(subplex)

ripple <- function (x) {
    r <- sqrt(sum(x^2))
    1-exp(-r^2)*cos(10*r)^2
}

fit <- subplex(par=c(1),fn=ripple,hessian=TRUE)
stopifnot(all.equal(fit$par,0,tol=1e-5))

fit <- subplex(par=c(1),fn="ripple",hessian=TRUE)
stopifnot(all.equal(fit$par,0,tol=1e-5))
print(fit$message)

fit <- subplex(par=c(1),fn="ripple",hessian=TRUE)
stopifnot(all.equal(fit$par,0,tol=1e-5))

fit <- subplex(par=c(0.1,3),fn=ripple,hessian=TRUE)
stopifnot(all.equal(fit$value,0,tol=1e-5))

fit <- subplex(par=c(0.1,3),fn=ripple,hessian=TRUE,
               control=list(parscale=c(0.01,0.001)))

fit <- subplex(par=c(0.1,3,2),fn=ripple,hessian=TRUE)
stopifnot(all.equal(fit$par,c(0.45932,1.10399,0.34408),tol=1e-4))
print(fit$message)

fit <- subplex(par=c(0.1,3),fn=ripple,control=list(reltol=0))
print(fit$message)
fit <- subplex(par=c(0.1,3),fn=ripple,control=list(reltol=0,maxit=10))
print(fit$message)

try(subplex(par=c(0.1,3,2),fn=3,hessian=FALSE))
try(subplex(par=c(0.1,3,2),fn=ripple,control=list(reltol=-100)))
try(subplex(par=c(0.1,3,2),fn=ripple,control=list(maxit=-100)))
try(subplex(par=numeric(0),fn=ripple))

fit <- subplex(par=c(0.1,3,2),fn=ripple,control=list(parscale=0.1))
stopifnot(all.equal(fit$value,1,tol=1e-4))

try(subplex(par=c(0.1,3,2),fn=ripple,control=list(parscale=c(0.1,0.5))))
try(subplex(par=c(0.1,3,2),fn=ripple,control=list(parscale=c(0.01,0.05,1e-30))))
fit <- subplex(par=c(0.1,3,2),fn=ripple,control=list(parscale=c(0.01,0.05,0.1)))

fit <- subplex(par=c(0.1,3,2),fn=ripple,control=list(maxit=2))
stopifnot(fit$conv==-1)

fit <- subplex(par=c(0.1,3,2),fn=ripple,control=list(reltol=1e-3))
stopifnot(all.equal(fit$value,0.791,tol=1e-3))

try(fit <- subplex(par=c(0.1,3,2),fn=ripple,control=list(parscale=c(1e-90))))
try(fit <- subplex(par=c(1e100,3e100,2e100),fn=ripple,control=list(parscale=1e-10)))

