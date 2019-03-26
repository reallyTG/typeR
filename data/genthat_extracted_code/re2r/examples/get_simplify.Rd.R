library(re2r)


### Name: get_simplify
### Title: Simplify pattern strings.
### Aliases: get_simplify

### ** Examples

get_simplify("a{1}")
get_simplify("a{3}b+(:?abc(a))")
get_simplify("a{2,3}a{2}")
get_simplify(re2("1+2",literal = TRUE))
get_pattern(re2("1+2",literal = TRUE))



