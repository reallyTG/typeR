library(gsl)


### Name: multimin
### Title: Function minimization
### Aliases: Multimin multimin multimin.init multimin.iterate
###   multimin.restart multimin.fminimizer.size
### Keywords: array

### ** Examples

# The Rosenbrock function:
x0 <- c(-1.2, 1)
f <- function(x) (1 - x[1])^2 + 100 * (x[2] - x[1]^2)^2
df <- function(x) c(-2*(1 - x[1]) + 100 * 2 * (x[2] - x[1]^2) * (-2*x[1]),
                    100 * 2 * (x[2] - x[1]^2))

# The simple way to call multimin.
state <- multimin(x0, f, df)
print(state$x)

# The fine-control way to call multimin.
state <- multimin.init(x0, f, df, method="conjugate-fr")
for (i in 1:200)
	state <- multimin.iterate(state)
print(state$x)



