library(envnames)


### Name: get_fun_name
### Title: Return the name of the current function or of a calling function
###   in the chain
### Aliases: get_fun_name

### ** Examples

# Show the name of the active function
f <- function() { cat("We are in function:", get_fun_name(), "\n") }
f()

# Show the name of the calling function
f <- function(x) { cat("Calling function name is:", get_fun_name(1), "\n") }
env1 <- new.env()
with(env1, g <- function() { f(3) })
env1$g()



