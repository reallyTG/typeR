library(lettercase)


### Name: make_names
### Title: make_names
### Aliases: make_names

### ** Examples

make_names(c("foo and bar", "foo-and-bar"), unique = TRUE)
  # "foo_and_bar"   "foo_and_bar_1"

  make_names(c("foo and bar", "foo.and_bar"), unique = FALSE)
  # "foo.and.bar"  "foo_and_bar"

  make_names(c("foo and bar", "foo.and_bar"), unique = TRUE)
  # "foo_and_bar"   "foo_and_bar_1"

  make_names( c(".foo", "_bar") )  # "foo" "bar"

  make_names( c(".foo", "_bar"), leading="." )  # ".foo" ".bar"



