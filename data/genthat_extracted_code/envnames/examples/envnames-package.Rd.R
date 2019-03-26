library(envnames)


### Name: envnames-package
### Title: Track user-defined environment names
### Aliases: envnames-package envnames
### Keywords: package environment

### ** Examples

library(envnames)
rm(list=ls())

### Example 1: Retrieve the names of user-defined environments (created with new.env())
# Create new environments
env1 <- new.env()                      # Environment in .GlobalEnv
env2 <- new.env()                      # Environment in .GlobalEnv
env3 <- new.env(parent=baseenv())      # Environment whose enclosure or parent environment
                                       # is the base environment
                                       # (as opposed to the global environment)
env_of_envs <- new.env()               # User-defined environment that contains other environments
with(env_of_envs, env11 <- new.env()) # Environment defined inside environment env_of_envs

# Retrieve the environment name
environment_name(env1)                       # named array with value "env1" and name "R_GlobalEnv"
environment_name(env3)                       # named array with value "env3" and name "R_GlobalEnv"
environment_name(env9)                       # NULL (env9 does not exist)
environment_name(env_of_envs)                # named array with value "env_of_envs" and name
                                             # "R_GlobalEnv"
environment_name(env11, envir=env_of_envs)   # "env11"
environment_name(env11)                      # named array with value "env11" and name
                                             # "R_GlobalEnv$env_of_envs"


### Example 2: Retrieve calling functions and their environments
### Note in particular the complicated use of sys.call() to retrieve the call as a string... 
# Define two environments
env1 <- new.env()
env2 <- new.env()
# Define function g() in environment env2 to be called by function f() below
# Function g() prints the name of the calling function.
with(env2,
     g <- function(x) {
       # Current function name
       fun_current_name = get_fun_name()

       # Get the name of the calling environment and function
			 fun_calling_name = get_fun_calling()

       # Show calling environment using and not using the envnames package
       cat("Now inside function", fun_current_name, "\n")
       cat("Calling environment name (using environmentName(parent.frame())):  \"",
            environmentName(parent.frame()), "\"\n", sep="")
       cat("Calling environment name (using sys.call(1) inside
           'as.character( as.list(sys.call(1))[[1]]) ))':", " \"",
            as.character( as.list(sys.call(1))[[1]]), "\"\n", sep="")
       cat("Calling environment name (using envnames::get_fun_calling()): \"",
           fun_calling_name, "\"\n", sep="")

       # Start process
       x = x + 2;
       return(invisible(x))
     }
)

# Calling function whose name should be printed when g() is run
with(env1,
     f <- function(x) {
       # Start
       gval = env2$g(x)
       return(invisible(gval))
     }
)

# Run function f to show the difference between using and
# not using the envnames package to retrieve the function calling stack.
env1$f(7)


### Example 3: find the location of an object
# This differs from the R function exists() because it also searches
# in user-defined environments and any environments wihin.
obj_find(f)                   # "env1"
obj_find("f")                 # Same thing: "env1"
obj_find("f", silent=FALSE)   # Same result, but run verbosely

env2$x <- 2
obj_find(x)                   # "env2"

obj_find(nonexistent)         # NULL

## Don't show: 
# This is not shown because the example is very similar to Example 3 above
# Define function g inside environment env3 whose parent is the baseenv environment
# In this case, we need to explicitly call the functions in package 'envnames' with envnames::<function>
with(env3,
     g <- function(x) {
       # Setup for environment tracking
#       env_address = envnames::setup_env(); on.exit(envnames::close_env(env_address))
       
       # Get the name of the calling environment
       env_calling_name = envnames::get_fun_calling_chain()[1,"env"]
       fun_calling_name = envnames::get_fun_name(1)
       cat("Now inside function", envnames::get_fun_name(), ": calling function is", fun_calling_name, ", calling environment is", env_calling_name, "\n")
       
       # Start process
       x = x + 3;
       return(invisible(x))
     }
)

# Calling function
h <- function(x) {
  # Start
  xval = env3$g(x)        # NOTE: The results are NOT what expected if calling g(x) as with(envir, g(x))... The envnames::get_env_calling() function in this case returns env3 as calling environment instead of the execution environment of h!! (WHY???)
  return(invisible(xval))
}

h(7)

### Cleanup: delete environments
rm(list=c("env1", "env2", "env3", "env_of_envs", "env_table_env_of_envs"))
## End(Don't show)



