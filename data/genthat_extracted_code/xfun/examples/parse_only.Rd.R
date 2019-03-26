library(xfun)


### Name: parse_only
### Title: Parse R code and do not keep the source
### Aliases: parse_only

### ** Examples

library(xfun)
parse_only("1+1")
parse_only(c("y~x", "1:5 # a comment"))
parse_only(character(0))



