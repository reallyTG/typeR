library(wrapr)


### Name: srcfn
### Title: Wrap the source for an exprssion as a function.
### Aliases: srcfn

### ** Examples


f <- srcfn(". + z", ".", args = list(z = 10))
cat(format(f))
1:3 %.>% f





