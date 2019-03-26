library(wrapr)


### Name: pkgfn
### Title: Wrap the name of a function as a function.
### Aliases: pkgfn

### ** Examples


f <- pkgfn("base::sin", "x")
cat(format(f))
1:3 %.>% f




