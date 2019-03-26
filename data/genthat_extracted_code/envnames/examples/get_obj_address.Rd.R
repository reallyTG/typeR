library(envnames)


### Name: get_obj_address
### Title: Return the memory address of an object
### Aliases: get_obj_address

### ** Examples

env1 = new.env()
env1$x = 3                       # x defined in environment 'env1'
x = 4                            # x defined in the Global Environment
get_obj_address(env1$x)          # returns the memory address of the object 'x'
                                 # defined in the 'env1' environment
get_obj_address(x, envir=env1)   # same as above
get_obj_address(x)               # Searches for object 'x' everywhere in the workspace and
                                 # returns a named array with the memory address of all its
                                 # occurrences, where the names are the names of the
                                 # environments where x was found.

# Memory addresses of objects whose names are stored in an array and retrieved using sapply()
env1$y <- 2;
objects <- c("x", "y")
sapply(objects, FUN=get_obj_address, envir=env1)	# Note that the address of object "x"
                                                 # is the same as the one returned above
                                                 # by get_obj_address(x, envir=env1)

# Memory address of elements of a list
alist <- list("x")
get_obj_address(alist[[1]])      # memory address of object 'x'
get_obj_address(alist[1])        # NULL because alist[1] has a memory address
                                 # that changes every time alist[1] is referred to.



