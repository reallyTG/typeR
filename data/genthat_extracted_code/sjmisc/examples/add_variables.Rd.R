library(sjmisc)


### Name: add_variables
### Title: Add variables or cases to data frames
### Aliases: add_variables add_case

### ** Examples

d <- data.frame(
  a = c(1, 2, 3),
  b = c("a", "b", "c"),
  c = c(10, 20, 30),
  stringsAsFactors = FALSE
)

add_case(d, b = "d")
add_case(d, b = "d", a = 5, .before = 1)

# adding a new case for a new variable
add_case(d, e = "new case")

add_variables(d, new = 5)
add_variables(d, new = c(4, 4, 4), new2 = c(5, 5, 5), .after = "b")




