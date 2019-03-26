library(wrapr)


### Name: makeFunction_se
### Title: Build an anonymous function.
### Aliases: makeFunction_se

### ** Examples


f <- makeFunction_se(as.name('x'), substitute({x*x}))
f(7)

f <- x := { x*x }
f(7)

g <- makeFunction_se(c(as.name('x'), as.name('y')), substitute({ x + 3*y }))
g(1,100)

g <- c(x,y) := { x + 3*y }
g(1,100)




