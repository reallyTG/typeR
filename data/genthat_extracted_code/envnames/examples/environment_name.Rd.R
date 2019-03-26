library(envnames)


### Name: environment_name
### Title: Retrieve the name of an environment
### Aliases: environment_name get_env_name

### ** Examples

# Retrieve name of a user-defined environment
env1 <- new.env()
environment_name(env1)                   		# "env1"

# Retrieve the name of an environment given as a memory address
env1_address = get_obj_address(env1)
environment_name(env1_address)           		# "env1"

# Create a copy of the above environment
env1_copy <- env1
environment_name(env1)                   		# "env1" "env1_copy"
# Retrieve just the env1 environment name
environment_name(env1, matchname=TRUE)   		# "env1"

# Retrieve the name of an environment defined within another environment
with(env1, envx <- new.env())
environment_name(env1$envx)              		# "env1$envx" "env1_copy$envx"
environment_name(env1$envx, matchname=TRUE)
  ## NULL, because the environment name is "envx", NOT "env1$envx"

# Get a function's execution environment name
with(env1, f <- function() { cat("We are inside function", environment_name()) })  
    ## "We are inside function env1$f"



