library(wrapr)


### Name: fnlist
### Title: Wrap a list of functions as a function.
### Aliases: fnlist

### ** Examples


f <- fnlist(pkgfn("base::sin", "x"), pkgfn("base::cos", "x"))
cat(format(f))
1:3 %.>% f




