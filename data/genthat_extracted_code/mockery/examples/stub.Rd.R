library(mockery)


### Name: stub
### Title: Replace a function with a stub.
### Aliases: stub stub

### ** Examples

f <- function() TRUE
g <- function() f()
stub(g, 'f', FALSE)

# now g() returns FALSE because f() has been stubbed out
g()




