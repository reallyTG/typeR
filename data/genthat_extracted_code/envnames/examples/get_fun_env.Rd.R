library(envnames)


### Name: get_fun_env
### Title: Return the execution environment of a function
### Aliases: get_fun_env

### ** Examples

# Define the function that is called to show the behaviour of get_fun_env()
h <- function(x) {
  # Get the value of parameter 'x' in the execution environment of function 'env1$g'
  # If function 'env1$g' is not found, 'x' is evaluated in the current environment of function
  xval = evalq(x, get_fun_env("env1$g")[[1]])
  return(xval)
}
# Define the function that calls h() in a user-defined environment 
env1 <- new.env()
with(env1, 
  g <- function(y) {
    x = 2
    return( h(y) )
  }
)
# Call env1$g()
cat("The value of variable 'x' inside env1$g is", env1$g(3), "\n") 
  ## Prints '2', because the value of x inside env1$g() is 2
  ## ('3' is the value of variable 'y' in env1$g(), not of variable 'x')

# When get_fun_env() is called from outside a function, it returns NULL
get_fun_env("env1$g")  # NULL, even if function 'g' exists,
                       # but we are not calling get_fun_env() from a function




