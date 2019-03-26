## ------------------------------------------------------------------------
fib <- function(n) if (n <= 1) 1 else fib(n-1) + fib(n-2)

## ------------------------------------------------------------------------
count.calls <- function(f) {
  force(f)
  function(...) {
    count <<- count+1;
    f(...)
  }
}

with_count <- function(f) {
  force(f)
  function(x) {
    count <<- 0
    c(n=x, result=f(x), calls=count)
  }
}

fib <- count.calls(fib)

t(sapply(1:16, with_count(fib)))

## ------------------------------------------------------------------------
library(memo)
fib <- memo(fib)
t(sapply(1:16, with_count(fib)))

## ------------------------------------------------------------------------
fib <- function(n) if (n <= 1) 1 else fib(n-1) + fib(n-2)
fib <- memo(count.calls(fib))
with_count(fib)(16)

