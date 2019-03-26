library(nseval)


### Name: dots
### Title: Dots objects: lists of quotations.
### Aliases: dots dots_ exprs exprs.dots exprs<- exprs<-.dots envs
###   envs.dots envs<- envs<-.dots [.dots [<-.dots c.dots c.quotation
###   as.data.frame.dots forced_dots_

### ** Examples


named.list <- function(...) {
 # Collect only named arguments, ignoring unnamed arguments.
 d <- dots(...)
 do(list, d[names(d) != ""])
}

named.list(a=1, b=2*2, stop("this is not evaluated"))



