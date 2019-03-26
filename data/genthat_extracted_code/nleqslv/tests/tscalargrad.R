# http://r.789695.n4.nabble.com/newton-method-td2306111.html#a2306111
# R-help, 29-07-2010: newton.method

library(nleqslv)

f <- function(x) 2.5*exp(-0.5*(2*0.045 - x)) + 2.5*exp(-0.045) + 2.5*exp(-1.5*x) - 100

g1 <- function(x) 0.5*2.5*exp(-0.5*(2*0.045 - x)) - 1.5*2.5*exp(-1.5*x)
g2 <- function(x) matrix(0.5*2.5*exp(-0.5*(2*0.045 - x)) - 1.5*2.5*exp(-1.5*x), nrow=1,ncol=1)

xu.1 <- uniroot(f,c(-3,0), tol=1e-8)$root
xu.2 <- uniroot(f,c( 6,8), tol=1e-8)$root

xg1.1 <- nleqslv(-2,f,g1)$x
xg2.1 <- nleqslv(-2,f,g2)$x

xg1.2 <- nleqslv(8,f,g1)$x
xg2.2 <- nleqslv(8,f,g2)$x

all.equal(xg1.1, xu.1)
all.equal(xg1.2, xu.2)
all.equal(xg1.2, xg2.2)

all.equal(xg2.1, xu.1)
all.equal(xg2.2, xu.2)
all.equal(xg1.2, xg2.2)
