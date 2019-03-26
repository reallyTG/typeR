library(rex)


### Name: re_substitutes
### Title: Substitute regular expressions in a string with another string.
### Aliases: re_substitutes substitutes s

### ** Examples

string <- c("this is a Test", "string")
re_substitutes(string, "test", "not a test", options = "insensitive")
re_substitutes(string, "i", "x", global = TRUE)
re_substitutes(string, "(test)", "not a \\1", options = "insensitive")



