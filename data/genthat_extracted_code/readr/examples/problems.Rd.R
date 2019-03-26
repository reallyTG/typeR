library(readr)


### Name: problems
### Title: Retrieve parsing problems
### Aliases: problems stop_for_problems

### ** Examples

x <- parse_integer(c("1X", "blah", "3"))
problems(x)

y <- parse_integer(c("1", "2", "3"))
problems(y)



