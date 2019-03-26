library(envnames)


### Name: get_env_names
### Title: Create a lookup table with address-name pairs of environments
### Aliases: get_env_names

### ** Examples

# Create example of chained environments
env1 <- new.env()
with(env1, env11 <- new.env())
with(env1$env11, envx <- new.env())

# Address-name pairs of all environments defined in the workspace,
# including environments in the search path
get_env_names()  # returns a data frame with at least the following user environments:
                 # "env1", "env1$env11", "env1$env11$envx"  

# Address-name pairs of the environments defined in a given user-defined environment
get_env_names(env1)  # returns a data frame with the following user environments:
                     # "env11", "env11$envx"

# Address-name pairs of the environments defined in a given package
get_env_names(as.environment("package:stats")) # should return an empty data frame
                                               # (since the stats package does not
                                               # have any environments defined)



