library(nleqslv)


### Name: nleqslv
### Title: Solving systems of nonlinear equations with Broyden or Newton
### Aliases: nleqslv
### Keywords: nonlinear optimize

### ** Examples

# Dennis Schnabel example 6.5.1 page 149
dslnex <- function(x) {
    y <- numeric(2)
    y[1] <- x[1]^2 + x[2]^2 - 2
    y[2] <- exp(x[1]-1) + x[2]^3 - 2
    y
}

jacdsln <- function(x) {
    n <- length(x)
    Df <- matrix(numeric(n*n),n,n)
    Df[1,1] <- 2*x[1]
    Df[1,2] <- 2*x[2]
    Df[2,1] <- exp(x[1]-1)
    Df[2,2] <- 3*x[2]^2

    Df
}

BADjacdsln <- function(x) {
    n <- length(x)
    Df <- matrix(numeric(n*n),n,n)
    Df[1,1] <- 4*x[1]
    Df[1,2] <- 2*x[2]
    Df[2,1] <- exp(x[1]-1)
    Df[2,2] <- 5*x[2]^2

    Df
}

xstart <- c(2,0.5)
fstart <- dslnex(xstart)
xstart
fstart

# a solution is c(1,1)

nleqslv(xstart, dslnex, control=list(btol=.01))

# Cauchy start
nleqslv(xstart, dslnex, control=list(trace=1,btol=.01,delta="cauchy"))

# Newton start
nleqslv(xstart, dslnex, control=list(trace=1,btol=.01,delta="newton"))

# final Broyden approximation of Jacobian (quite good)
z <- nleqslv(xstart, dslnex, jacobian=TRUE,control=list(btol=.01))
z$x
z$jac
jacdsln(z$x)

# different initial start; not a very good final approximation
xstart <- c(0.5,2)
z <- nleqslv(xstart, dslnex, jacobian=TRUE,control=list(btol=.01))
z$x
z$jac
jacdsln(z$x)

## Not run: 
##D # no global strategy but limit stepsize
##D # but look carefully: a different solution is found
##D nleqslv(xstart, dslnex, method="Newton", global="none", control=list(trace=1,stepmax=5))
##D 
##D # but if the stepsize is limited even more the c(1,1) solution is found
##D nleqslv(xstart, dslnex, method="Newton", global="none", control=list(trace=1,stepmax=2))
##D 
##D # Broyden also finds the c(1,1) solution when the stepsize is limited
##D nleqslv(xstart, dslnex, jacdsln, method="Broyden", global="none", control=list(trace=1,stepmax=2))
## End(Not run)

# example with a singular jacobian in the initial guess
f <- function(x) {
    y <- numeric(3)
    y[1] <- x[1] + x[2] - x[1]*x[2] - 2
    y[2] <- x[1] + x[3] - x[1]*x[3] - 3
    y[3] <- x[2] + x[3] - 4
    return(y)
}

Jac <- function(x) {
    J <- matrix(0,nrow=3,ncol=3)
    J[,1] <- c(1-x[2],1-x[3],0)
    J[,2] <- c(1-x[1],0,1)
    J[,3] <- c(0,1-x[1],1)
    J
}

# exact solution
xsol <- c(-.5, 5/3 , 7/3)
xsol

xstart <- c(1,2,3)
J <- Jac(xstart)
J
rcond(J)

z <- nleqslv(xstart,f,Jac, method="Newton",control=list(trace=1,allowSingular=TRUE))
all.equal(z$x,xsol)



