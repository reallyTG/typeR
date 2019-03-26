library(wrapr)


### Name: wrapfn
### Title: Wrap the source for an exprssion as a function.
### Aliases: wrapfn

### ** Examples


f <- wrapfn(sin, "x")
cat(format(f))
1:3 %.>% f




