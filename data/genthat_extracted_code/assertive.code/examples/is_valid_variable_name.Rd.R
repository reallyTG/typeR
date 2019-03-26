library(assertive.code)


### Name: assert_all_are_valid_variable_names
### Title: Is the string a valid variable name?
### Aliases: assert_all_are_valid_variable_names
###   assert_any_are_valid_variable_names is_valid_variable_name

### ** Examples

make_random_string <- function(n)
{
  paste0(sample(letters, n, replace = TRUE), collapse = "")
}
long <- c(make_random_string(10000), make_random_string(10001))
x <- c("x", "y_y0.Y", ".", "x y", "...", "..1", long)
unname(is_valid_variable_name(x))
unname(is_valid_variable_name(x, allow_reserved = FALSE))
#These examples should fail.
assertive.base::dont_stop(
  assert_all_are_valid_variable_names(c("...", "..1"), allow_reserved = FALSE)
)



