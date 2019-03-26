library(pryr)


### Name: parenvs
### Title: Given an environment or object, return an 'envlist' of its
###   parent environments.
### Aliases: parenvs

### ** Examples

# Print the current environment and its parents
parenvs()

# Print the parent environments of the load_all function
e <- parenvs(parenvs)
e

# Get all parent environments, going all the way to empty env
e <- parenvs(parenvs, TRUE)
e

# Print e with paths
print(e, path = TRUE)

# Print the first 6 environments in the envlist
e[1:6]

# Print just the parent environment of load_all.
# This is an envlist with one element.
e[1]

# Pull that environment out of the envlist and see what's in it.
e[[1]]
ls(e[[1]], all.names = TRUE)



