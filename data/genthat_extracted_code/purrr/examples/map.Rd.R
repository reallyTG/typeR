library(purrr)


### Name: map
### Title: Apply a function to each element of a vector
### Aliases: map map_if map_at map_lgl map_chr map_int map_dbl map_raw
###   map_dfr map_df map_dfc walk map_depth

### ** Examples

1:10 %>%
  map(rnorm, n = 10) %>%
  map_dbl(mean)

# Or use an anonymous function
1:10 %>%
  map(function(x) rnorm(10, x))

# Or a formula
1:10 %>%
  map(~ rnorm(10, .x))

# The names of the input are preserved in the output:
list(foo = 1, bar = 2) %>% map(`+`, 10)

# Using set_names() with character vectors is handy to keep track
# of the original inputs:
set_names(c("foo", "bar")) %>% map_chr(paste0, ":suffix")

# Extract by name or position
# .default specifies value for elements that are missing or NULL
l1 <- list(list(a = 1L), list(a = NULL, b = 2L), list(b = 3L))
l1 %>% map("a", .default = "???")
l1 %>% map_int("b", .default = NA)
l1 %>% map_int(2, .default = NA)

# Supply multiple values to index deeply into a list
l2 <- list(
  list(num = 1:3,     letters[1:3]),
  list(num = 101:103, letters[4:6]),
  list()
)
l2 %>% map(c(2, 2))

# Use a list to build an extractor that mixes numeric indices and names,
# and .default to provide a default value if the element does not exist
l2 %>% map(list("num", 3))
l2 %>% map_int(list("num", 3), .default = NA)


# Use a predicate function to decide whether to map a function:
map_if(iris, is.factor, as.character)

# Specify an alternative with the `.else` argument:
map_if(iris, is.factor, as.character, .else = as.integer)

# A more realistic example: split a data frame into pieces, fit a
# model to each piece, summarise and extract R^2
mtcars %>%
  split(.$cyl) %>%
  map(~ lm(mpg ~ wt, data = .x)) %>%
  map(summary) %>%
  map_dbl("r.squared")

# Use map_lgl(), map_dbl(), etc to reduce to a vector.
# * list
mtcars %>% map(sum)
# * vector
mtcars %>% map_dbl(sum)

# If each element of the output is a data frame, use
# map_dfr to row-bind them together:
mtcars %>%
  split(.$cyl) %>%
  map(~ lm(mpg ~ wt, data = .x)) %>%
  map_dfr(~ as.data.frame(t(as.matrix(coef(.)))))
# (if you also want to preserve the variable names see
# the broom package)

# Use `map_depth()` to recursively traverse nested vectors and map
# a function at a certain depth:
x <- list(a = list(foo = 1:2, bar = 3:4), b = list(baz = 5:6))
str(x)
map_depth(x, 2, paste, collapse = "/")

# Equivalent to:
map(x, map, paste, collapse = "/")



