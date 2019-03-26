library(mgcv)


### Name: ls.size
### Title: Size of list elements
### Aliases: ls.size

### ** Examples

library(mgcv)
b <- list(M=matrix(runif(100),10,10),quote=
"The world is ruled by idiots because only an idiot would want to rule the world.",
fam=binomial())
ls.size(b)



