library(testextra)


### Name: string-tests
### Title: Tests for strings
### Aliases: string-tests is_nonempty_string is_optional_string

### ** Examples

# TRUE
is_nonempty_string("hello")

# All FALSE
x <- c("hello", "world")
is_nonempty_string(x)
is_nonempty_string(NA_character_)
is_nonempty_string(character(0))
is_nonempty_string(NULL)
is_nonempty_string(12345)



