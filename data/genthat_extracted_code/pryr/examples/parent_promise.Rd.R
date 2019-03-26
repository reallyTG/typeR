library(pryr)


### Name: parent_promise
### Title: Find the parent (first) promise.
### Aliases: parent_promise

### ** Examples

f <- function(x) g(x)
g <- function(y) h(y)
h <- function(z) parent_promise(z)

h(x + 1)
g(x + 1)
f(x + 1)



