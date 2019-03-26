library(stringr)


### Name: str_interp
### Title: String interpolation.
### Aliases: str_interp
### Keywords: internal

### ** Examples


# Using values from the environment, and some formats
user_name <- "smbache"
amount <- 6.656
account <- 1337
str_interp("User ${user_name} (account $[08d]{account}) has $$[.2f]{amount}.")

# Nested brace pairs work inside expressions too, and any braces can be
# placed outside the expressions.
str_interp("Works with } nested { braces too: $[.2f]{{{2 + 2}*{amount}}}")

# Values can also come from a list
str_interp(
  "One value, ${value1}, and then another, ${value2*2}.",
  list(value1 = 10, value2 = 20)
)

# Or a data frame
str_interp(
  "Values are $[.2f]{max(Sepal.Width)} and $[.2f]{min(Sepal.Width)}.",
  iris
)

# Use a vector when the string is long:
max_char <- 80
str_interp(c(
  "This particular line is so long that it is hard to write ",
  "without breaking the ${max_char}-char barrier!"
))



