library(ore)


### Name: es
### Title: Expression substitution
### Aliases: es

### ** Examples

es("pi is #{pi}")
es("pi is \\#{pi}")
es("The square-root of pi is approximately #{sqrt(pi)}", signif=4)
es("1/(1+x) for x=3 is #{x <- 3; 1/(1+x)}")



