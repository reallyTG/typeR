library(rlang)


### Name: scoped_options
### Title: Change global options
### Aliases: scoped_options with_options push_options peek_options
###   peek_option
### Keywords: experimental

### ** Examples

# Store and retrieve a global option:
push_options(my_option = 10)
peek_option("my_option")

# Change the option temporarily:
with_options(my_option = 100, peek_option("my_option"))
peek_option("my_option")

# The scoped variant is useful within functions:
fn <- function() {
  scoped_options(my_option = 100)
  peek_option("my_option")
}
fn()
peek_option("my_option")

# The plural peek returns a named list:
peek_options("my_option")
peek_options("my_option", "digits")



