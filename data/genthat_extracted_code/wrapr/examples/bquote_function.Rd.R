library(wrapr)


### Name: bquote_function
### Title: Adapt a function to use bquote on its arguments.
### Aliases: bquote_function

### ** Examples


f1 <- function(x) { substitute(x) }
f2 <- bquote_function(f1)
arg <- as.name("USER_ARG")
f2(arg)    # returns arg
f2(.(arg)) # returns USER_ARG




