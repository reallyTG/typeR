library(subplex)

## Rosenbrock Banana function
rosen <- function (x) {
    x1 <- x[1]
    x2 <- x[2]
    100*(x2-x1*x1)^2+(1-x1)^2
}

fit <- subplex(par=c(11,-33),fn=rosen)
stopifnot(all.equal(fit$par,c(1,1),tol=1e-4))

rosen2 <- function (x) {
    X <- matrix(x,ncol=2) 
    sum(apply(X,1,rosen))
}

fit <- subplex(par=c(-33,11,14,9,0,12),fn=rosen2,control=list(maxit=30000))
stopifnot(all.equal(fit$par,c(1,1,1,1,1,1),tol=1e-4))

fit <- subplex(par=c(-33,11,14,9,0,12,15,9,-150,123),fn=rosen2,control=list(maxit=5e5),hessian=TRUE)

## Rosenbrock Banana function (using names)
rosen <- function (x, g = 0, h = 0) {
    x1 <- x['a']
    x2 <- x['b']-h
    100*(x2-x1*x1)^2+(1-x1)^2+g
}

fit <- subplex(par=c(b=11,a=-33),fn=rosen,h=22,
               control=list(abstol=1e-9,parscale=5),hessian=TRUE)
stopifnot(all.equal(fit$par,c(b=23,a=1),tol=1e-5))
stopifnot(all.equal(as.numeric(fit$hessian),c(200,-400,-400,802),tol=1e-5))

