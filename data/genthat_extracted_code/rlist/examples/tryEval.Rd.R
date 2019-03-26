library(rlist)


### Name: tryEval
### Title: Try to evaluate an expression and return a default value if an
###   error occurs or otherwise return its value.
### Aliases: tryEval

### ** Examples

x <- list(a=c(x=1,y=2),b=c(x=2,p=3))
list.map(x, tryEval(x+y, NA))



