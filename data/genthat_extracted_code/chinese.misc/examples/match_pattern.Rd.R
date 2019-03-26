library(chinese.misc)


### Name: match_pattern
### Title: Extract Strings by Regular Expression Quickly
### Aliases: match_pattern

### ** Examples

p <- "x.*?y"
x <- c("x6yx8y", "x10yx30y", "aaaaaa", NA, "x00y")
y <- match_pattern(p, x)
y <- match_pattern(p, x, vec_result = FALSE)



