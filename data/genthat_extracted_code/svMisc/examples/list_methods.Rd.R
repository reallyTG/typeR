library(svMisc)


### Name: list_methods
### Title: List all methods associated with a generic function or a class,
###   or all types associated with a method
### Aliases: list_methods list_types listMethods listTypes
### Keywords: utilities

### ** Examples

# Generic functions
list_methods("t.test")               # S3
list_methods("show", mixed = FALSE)	# S4
list_methods("ls") # None, not a generic function!

# Classes
# Only the following methods are considered
getOption("gui.methods")
list_methods(class = "data.frame")
list_methods(class = "lm")

# List method types
list_types("view")  # All default view types currently defined
list_types("view", "data.frame")
list_types("view", "data.frame", TRUE) # None, except if you defined custom views!



