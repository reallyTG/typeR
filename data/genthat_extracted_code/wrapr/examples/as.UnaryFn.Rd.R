library(wrapr)


### Name: as.UnaryFn
### Title: Convert a list of UnaryFns into a UnaryFn.
### Aliases: as.UnaryFn

### ** Examples


f <- as.UnaryFn(list(pkgfn("base::sin", "x"), pkgfn("base::cos", "x")))
cat(format(f))
1:3 %.>% f




