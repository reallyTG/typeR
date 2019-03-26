library(readr)


### Name: parse_factor
### Title: Parse factors
### Aliases: parse_factor col_factor

### ** Examples

parse_factor(c("a", "b"), letters)

x <- c("cat", "dog", "caw")
levels <- c("cat", "dog", "cow")

# Base R factor() silently converts unknown levels to NA
x1 <- factor(x, levels)

# parse_factor generates a warning & problems
x2 <- parse_factor(x, levels)

# Using an argument of `NULL` will generate levels based on values of `x`
x2 <- parse_factor(x, levels = NULL)



