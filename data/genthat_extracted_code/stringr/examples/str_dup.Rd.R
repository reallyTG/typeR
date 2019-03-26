library(stringr)


### Name: str_dup
### Title: Duplicate and concatenate strings within a character vector.
### Aliases: str_dup

### ** Examples

fruit <- c("apple", "pear", "banana")
str_dup(fruit, 2)
str_dup(fruit, 1:3)
str_c("ba", str_dup("na", 0:5))



