library(assertive.properties)


### Name: assert_is_atomic
### Title: Is the input atomic/recursive/vector?
### Aliases: assert_is_atomic assert_is_nested assert_is_non_nested
###   assert_is_recursive assert_is_vector is_atomic is_nested
###   is_non_nested is_recursive is_vector

### ** Examples

atomic_types <- list(
  logical(),
  integer(),
  numeric(), 
  complex(),
  character(), 
  raw(),
  matrix(), 
  array(),
  factor(),
  NULL
)
for(var in atomic_types) assert_is_atomic(var)

recursive_types <- list(
  list(), 
  expression(),
  data.frame(), 
  y ~ x,
  function(){},
  call("sin", "pi")
)
for(var in recursive_types) assert_is_recursive(var)

# Names are neither atomic nor recursive
a_name <- as.name("x")
is_atomic(a_name)
is_recursive(a_name)

vector_types <- c(
  atomic_types[1:6], 
  recursive_types[1:2]
)
for(var in vector_types) assert_is_vector(var)

# Nested objects are recursive and have at least one recursive element
nested_list <- list(a = 1, b = list(2:3))
assert_is_nested(nested_list)
for(elt in nested_list) assert_is_non_nested(elt)



