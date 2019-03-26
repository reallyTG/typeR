library(mco)


### Name: nsga2
### Title: NSGA II MOEA
### Aliases: nsga2
### Keywords: optimize

### ** Examples

## Binh 1 problem:
binh1 <- function(x) {
  y <- numeric(2)
  y[1] <- crossprod(x, x)
  y[2] <- crossprod(x - 5, x - 5)
  return (y)
}
r1 <- nsga2(binh1, 2, 2,
           generations=150, popsize=100,
           cprob=0.7, cdist=20,
           mprob=0.2, mdist=20,
           lower.bounds=rep(-5, 2),
           upper.bounds=rep(10, 2))
plot(r1)

## VNT problem:
vnt <- function(x) {  
  y <- numeric(3)
  xn <- crossprod(x, x)
  y[1] <- xn/2 + sin(xn);
  y[2] <- (crossprod(c(3, -2), x) + 4)^2/8 + (crossprod(c(1, -1), x) + 1)^2/27 + 15
  y[3] <- 1/(xn + 1) - 1.1*exp(-xn)
  return (y)
}

r2 <- nsga2(vnt, 2, 3,
           generations=150, popsize=100,
           lower.bounds=rep(-3, 2),
           upper.bounds=rep(3, 2))
plot(r2)

## Example using constraints:
## minimize     f(x) = (x[1]^2, x[2]^2)
## subject to   g(x) = (sum(x) - 5) >= 0
f <- function(x) { x^2 }
g <- function(x) { sum(x) - 5 }
res <- nsga2(f, 2, 2, generations=500,
             lower.bounds=c(0, 0), upper.bounds=c(10, 10),
             constraints=g, cdim=1)
opar <-par(mfrow=c(1,2))
plot(res, xlab="y1", ylab="y2", main="Objective space")
plot(res$par, xlab="x1", ylab="x2", main="Parameter space")
par(opar)



