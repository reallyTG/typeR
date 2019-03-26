library(pryr)


### Name: f
### Title: A compact syntax for anonymous functions.
### Aliases: f

### ** Examples

f(x + y)
f(x + y)(1, 10)
f(x, y = 2, x + y)

f({y <- runif(1); x + y})



