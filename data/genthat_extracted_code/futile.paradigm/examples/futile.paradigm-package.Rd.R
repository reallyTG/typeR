library(futile.paradigm)


### Name: futile.paradigm-package
### Title: A framework for working in a functional programming paradigm in
###   R
### Aliases: futile.paradigm-package futile.paradigm paradigm.options
### Keywords: package

### ** Examples

# The guard must be defined before the concrete function variant
abs_max %when% is.numeric(a)
abs_max %also% (length(a) > 1)
# This adds a post-assertion to ensure the value is what you expect
abs_max %must% (result > 0)
abs_max %as% function(a) abs_max(a[1], abs_max(a[2:length(a)]))

abs_max %when% (is.numeric(a) && length(a) == 1)
abs_max %must% (result == a)
abs_max %as% function(a) a

abs_max %when% (a %isa% DataObject & a %hasa% data)
abs_max %as% function(a) abs_max(as.numeric(strsplit(a$data, ',')[[1]]))

abs_max %when% (is.numeric(a) & is.numeric(b))
abs_max %must% (result >= a | result >= b)
abs_max %as% function(a, b) max(abs(a), abs(b))

# Using a guard of TRUE acts as a default condition
abs_max %when% TRUE
abs_max %as% function(a,b) abs_max(as.numeric(a), as.numeric(b))

# Define constructor for DataObject
create.DataObject <- function(T, data, name=NA) list(name=name, data=data)

# Test some output
abs_max(2,-3) # Calls abs_max.twoArg

abs_max("3","-4") # Calls abs_max.twoArgDefault

abs_max(3,"-4") # Calls abs_max.twoArgDefault

a <- rnorm(10)
abs_max(a) # Calls abs_max.recursive1

b <- create(DataObject, c('12,-3,-5,8,-13,3,1,3'))
abs_max(b) # Calls abs_max.csv


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

iterate %when% (algo %isa% NewtonRaphson)
iterate %as% function(x, algo) x - algo$f1(x) / algo$f2(x)

iterate %when% (algo %isa% GradientDescent)
iterate %as% function(x, algo) x - algo$step * algo$f1(x)

create.GradientDescent <- function(T, f1, step=0.01) list(f1=f1,step=step)


fx <- function(x) x^2 - 4
f1 <- function(x) 2*x
f2 <- function(x) 2

algo <- create(NewtonRaphson, f1=f1,f2=f2)
minimize(3, algo)

algo <- create(GradientDescent, f1=f1,step=0.1)
minimize(3, algo)



