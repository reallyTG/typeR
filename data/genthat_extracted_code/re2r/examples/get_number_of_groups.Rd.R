library(re2r)


### Name: get_number_of_groups
### Title: Return the number of capturing subpatterns
### Aliases: get_number_of_groups

### ** Examples

regexp = re2("1")
get_number_of_groups(regexp)

get_number_of_groups(re2("((?P<a>123)(12))"))

# uncaptured groups
get_number_of_groups(re2("(?:(?:(?:(?:(?:.)?){100})*)+)"))



