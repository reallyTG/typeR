library(pryr)


### Name: uneval
### Title: Capture the call associated with a promise.
### Aliases: uneval

### ** Examples

f <- function(x) {
   uneval(x)
}
f(a + b)
f(1 + 4)

delayedAssign("x", 1 + 4)
uneval(x)
x
uneval(x)



