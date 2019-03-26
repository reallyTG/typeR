library(purrr)


### Name: attr_getter
### Title: Create an attribute getter function
### Aliases: attr_getter

### ** Examples

# attr_getter() takes an attribute name and returns a function to
# access the attribute:
get_rownames <- attr_getter("row.names")
get_rownames(mtcars)

# These getter functions are handy in conjunction with pluck() for
# extracting deeply into a data structure. Here we'll first
# extract by position, then by attribute:
obj1 <- structure("obj", obj_attr = "foo")
obj2 <- structure("obj", obj_attr = "bar")
x <- list(obj1, obj2)

pluck(x, 1, attr_getter("obj_attr"))  # From first object
pluck(x, 2, attr_getter("obj_attr"))  # From second object



