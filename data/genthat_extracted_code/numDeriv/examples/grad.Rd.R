library(numDeriv)


### Name: grad
### Title: Numerical Gradient of a Function
### Aliases: grad grad.default
### Keywords: multivariate

### ** Examples

  grad(sin, pi)
  grad(sin, (0:10)*2*pi/10)
  func0 <- function(x){ sum(sin(x))  }
  grad(func0 , (0:10)*2*pi/10)

  func1 <- function(x){ sin(10*x) - exp(-x) }

  curve(func1,from=0,to=5)

  x <- 2.04
  numd1 <- grad(func1, x)
  exact <- 10*cos(10*x) + exp(-x)
  c(numd1, exact, (numd1 - exact)/exact)

  x <- c(1:10)
  numd1 <- grad(func1, x)
  numd2 <- grad(func1, x, "complex")
  exact <- 10*cos(10*x) + exp(-x)
  cbind(numd1, numd2, exact, (numd1 - exact)/exact, (numd2 - exact)/exact)

  sc2.f <- function(x){
    n <- length(x)
    sum((1:n) * (exp(x) - x)) / n
    }

  sc2.g <- function(x){
    n <- length(x)
    (1:n) * (exp(x) - 1) / n
    }

  x0 <- rnorm(100)
  exact <- sc2.g(x0)

  g <- grad(func=sc2.f, x=x0)
  max(abs(exact - g)/(1 + abs(exact)))

  gc <- grad(func=sc2.f, x=x0, method="complex")
  max(abs(exact - gc)/(1 + abs(exact)))

  f <- function(x) if(x[1]<=0) sum(sin(x)) else  NA
  grad(f, x=c(0,0), method="Richardson", side=c(-1,  1))



