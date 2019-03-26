library(envnames)


### Name: get_fun_calling
### Title: Return the name of a calling function and its environment
### Aliases: get_fun_calling

### ** Examples

# Prepare environments
env1 <- new.env()
env2 <- new.env()
with(env2, env21 <- new.env())

# Function that shows the names of calling functions in the chain and their environments
f <- function(x) {
 cat("Now in function:", get_fun_calling(0), "\n")
 cat("\tName of the calling function:", get_fun_calling(), "\n")
 cat("\tName of the calling function two levels up:", get_fun_calling(2), "\n")
 cat("\tName of the calling function three levels up:", get_fun_calling(3), "\n")
 cat("\tName of the calling function four levels up:", get_fun_calling(4), "\n")
}

# Prepare a calling chain  
with(env1, g <- function() { f(3) })
with(env2, h <- function() { env1$g() })
with(env2$env21, hh <- function() { env2$h() })

# Run the different functions defined to show the different calling chains
env1$g()
env2$h()
env2$env21$hh()



