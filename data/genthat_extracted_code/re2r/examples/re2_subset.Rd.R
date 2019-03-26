library(re2r)


### Name: re2_subset
### Title: Keep strings matching a pattern.
### Aliases: re2_subset

### ** Examples

fruit <- c("apple", "banana", "pear", "pinapple")
re2_subset(fruit, "a")
re2_subset(fruit, "^a")
re2_subset(fruit, "a$")
re2_subset(fruit, "b")
re2_subset(fruit, "[aeiou]")

re2_subset(c("a", NA, "b"), ".")



