library(lambda.r)


### Name: lambda.r-package
### Title: Modeling Data with Functional Programming
### Aliases: lambda.r-package lambda.r
### Keywords: package programming

### ** Examples

is.wholenumber <-
  function(x, tol = .Machine$double.eps^0.5)  abs(x - round(x)) < tol

## Use built in types for type checking
fib(n) %::% numeric : numeric
fib(0) %as% 1
fib(1) %as% 1
fib(n) %when% {
  is.wholenumber(n)
} %as% {
  fib(n-1) + fib(n-2)
}

fib(5)


## Using custom types
Integer(x) %when% { is.wholenumber(x) } %as% x

fib.a(n) %::% Integer : Integer
fib.a(0) %as% Integer(1)
fib.a(1) %as% Integer(1)
fib.a(n) %as% { Integer(fib.a(n-1) + fib.a(n-2)) }

fib.a(Integer(5))


## Newton-Raphson optimization
converged <- function(x1, x0, tolerance=1e-6) abs(x1 - x0) < tolerance
minimize <- function(x0, algo, max.steps=100)
{
  step <- 0
  old.x <- x0
  while (step < max.steps)
  {
    new.x <- iterate(old.x, algo)
    if (converged(new.x, old.x)) break
    old.x <- new.x
  }
  new.x
}

iterate(x, algo) %::% numeric : NewtonRaphson : numeric
iterate(x, algo) %as% { x - algo$f1(x) / algo$f2(x) }

iterate(x, algo) %::% numeric : GradientDescent : numeric
iterate(x, algo) %as% { x - algo$step * algo$f1(x) }

NewtonRaphson(f1, f2) %as% list(f1=f1, f2=f2)
GradientDescent(f1, step=0.01) %as% list(f1=f1, step=step)


fx <- function(x) x^2 - 4
f1 <- function(x) 2*x
f2 <- function(x) 2

algo <- NewtonRaphson(f1,f2)
minimize(3, algo)

algo <- GradientDescent(f1, step=0.1)
minimize(3, algo)



