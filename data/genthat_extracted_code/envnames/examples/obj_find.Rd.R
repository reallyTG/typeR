library(envnames)


### Name: obj_find
### Title: Find an object in the workspace including user-defined
###   environments
### Aliases: obj_find

### ** Examples

# Define a variable in the global environment
x = 4
# Create new environments, some nested
env1 = new.env()
with(env1, envx <- new.env())
env1$x = 3
env1$envx$x = 2
env1$y = 5

# Look for objects (crawling environments recursively)
obj_find(x)                  # "env1" "env1$envx" "R_GlobalEnv"
obj_find("x")                # "env1" "env1$envx" "R_GlobalEnv"
obj_find("x", envir=env1)    # "env1" "envx" (as the search is limited to the env1 environment)
obj_find("y")                # "env1"
obj_find(nonexistent)        # NULL (note that NO error is raised even if the object does not exist)



