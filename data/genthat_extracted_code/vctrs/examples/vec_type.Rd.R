library(vctrs)


### Name: vec_type
### Title: Find the prototype of a set of vectors
### Aliases: vec_type vec_type_common vec_ptype

### ** Examples

# Unknown types ------------------------------------------
vec_ptype()
vec_ptype(NA)
vec_ptype(NULL)

# Vectors ------------------------------------------------
vec_ptype(1:10)
vec_ptype(letters)
vec_ptype(TRUE)

vec_ptype(Sys.Date())
vec_ptype(Sys.time())
vec_ptype(factor("a"))
vec_ptype(ordered("a"))

# Matrices -----------------------------------------------
# The prototype of a matrix includes the number of columns
vec_ptype(array(1, dim = c(1, 2)))
vec_ptype(array("x", dim = c(1, 2)))

# Data frames --------------------------------------------
# The prototype of a data frame includes the prototype of
# every column
vec_ptype(iris)

# The prototype of multiple data frames includes the prototype
# of every column that in any data frame
vec_ptype(
  data.frame(x = TRUE),
  data.frame(y = 2),
  data.frame(z = "a")
)



