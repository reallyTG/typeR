library(assertive.properties)


### Name: assert_has_duplicates
### Title: Does the input have duplicates?
### Aliases: assert_has_duplicates assert_has_no_duplicates has_duplicates
###   has_no_duplicates

### ** Examples

x <- sample(10, 100, replace = TRUE)
assert_has_duplicates(x)
has_no_duplicates(x)



