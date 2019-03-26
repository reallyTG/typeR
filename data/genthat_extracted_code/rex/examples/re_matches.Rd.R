library(rex)


### Name: re_matches
### Title: Match function
### Aliases: re_matches matches m

### ** Examples

string <- c("this is a", "test string")
re_matches(string, rex("test")) # FALSE FALSE

# named capture
re_matches(string, rex(capture(alphas, name = "first_word"), space,
  capture(alphas, name = "second_word")))
#   first_word second_word
# 1       this          is
# 2       test      string

# capture returns NA when it fails to match
re_matches(string, rex(capture("test")))
#      1
# 1 test
# 2 <NA>



