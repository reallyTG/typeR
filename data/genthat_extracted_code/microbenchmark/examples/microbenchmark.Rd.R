library(microbenchmark)


### Name: microbenchmark
### Title: Sub-millisecond accurate timing of expression evaluation.
### Aliases: microbenchmark

### ** Examples

## Measure the time it takes to dispatch a simple function call
## compared to simply evaluating the constant \code{NULL}
f <- function() NULL
res <- microbenchmark(NULL, f(), times=1000L)

## Print results:
print(res)

## Plot results:
boxplot(res)

## Pretty plot:
if (requireNamespace("ggplot2")) {
  ggplot2::autoplot(res)
}

## Example check usage
my_check <- function(values) {
  all(sapply(values[-1], function(x) identical(values[[1]], x)))
}

f <- function(a, b)
  2 + 2

a <- 2
## Check passes
microbenchmark(2 + 2, 2 + a, f(2, a), f(2, 2), check=my_check)
## Not run: 
##D a <- 3
##D ## Check fails
##D microbenchmark(2 + 2, 2 + a, f(2, a), f(2, 2), check=my_check)
## End(Not run)
## Example setup usage
set.seed(21)
x <- rnorm(10)
microbenchmark(x, rnorm(10), check=my_check, setup=set.seed(21))
## Will fail without setup
## Not run: 
##D microbenchmark(x, rnorm(10), check=my_check)
## End(Not run)



