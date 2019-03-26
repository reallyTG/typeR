library(wrapr)


### Name: as_fn
### Title: Convert a pipeable object into a function.
### Aliases: as_fn

### ** Examples


p <- pkgfn("base::sin", "x")
f <- as_fn(p)
f(5)





