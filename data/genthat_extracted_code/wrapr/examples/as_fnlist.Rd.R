library(wrapr)


### Name: as_fnlist
### Title: Wrap a list of UnaryFns as a UnaryFnList.
### Aliases: as_fnlist

### ** Examples


f <- as_fnlist(list(pkgfn("base::sin", "x"), pkgfn("base::cos", "x")))
cat(format(f))
1:3 %.>% f




