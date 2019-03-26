library(re2r)


### Name: re2
### Title: Create a pre-compiled regular expression
### Aliases: re2

### ** Examples

regexp = re2("test")
regexp

re2_match("abc\ndef","(?s)(.*)")
re2_match("abc\ndef", re2("(?s)(.*)", never_nl = TRUE))

re2_detect("\n", re2(".", dot_nl = TRUE))
re2_detect("\n", ".")

get_number_of_groups(re2("(A)(v)",never_capture = TRUE))

re2_match("aaabaaaa",re2("(a|aaa)",longest_match = TRUE))
re2_match("aaabaaaa",re2("(a|aaa)",longest_match = FALSE))

re2_match("a+b", re2("a+b", literal = TRUE))

re2_detect("abc" , re2("abc", posix_syntax = TRUE))
re2("(?P<name>re)")

## Not run: 
##D 
##D expect_error(re2("(?P<name>re)", posix_syntax = TRUE))
## End(Not run)




