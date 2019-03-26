library(qdapRegex)


### Name: is.regex
### Title: Test Regular Expression Validity
### Aliases: is.regex
### Keywords: regex, valid

### ** Examples

is.regex("I|***")
is.regex("I|i")

sapply(regex_usa, is.regex)
sapply(regex_supplement, is.regex) ## `version` is not a valid regex



