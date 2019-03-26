library(roxygen2)


### Name: roclet_find
### Title: Create a roclet from a string.
### Aliases: roclet_find

### ** Examples

# rd, namespace, and vignette work for backward compatibility
roclet_find("rd")

# But generally you should specify the name of a function that
# returns a roclet
roclet_find("rd_roclet")

# If it lives in another package, you'll need to use ::
roclet_find("roxygen2::rd_roclet")

# If it takes parameters (which no roclet does currently), you'll need
# to call the function
roclet_find("roxygen2::rd_roclet()")



