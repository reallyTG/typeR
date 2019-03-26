library(re2r)


### Name: re2_locate
### Title: Locate the position of patterns in a string.
### Aliases: re2_locate re2_locate_all

### ** Examples

re2_locate("yabba dabba doo", "d")

fruit <- c("apple", "banana", "pear", "pineapple")
re2_locate(fruit, "$")
re2_locate(fruit, "a")
re2_locate(fruit, "e")
re2_locate(fruit, c("a", "b", "p", "p"))

re2_locate_all(fruit, "a")
re2_locate_all(fruit, "e")
re2_locate_all(fruit, c("a", "b", "p", "p"))

# Find location of every character
re2_locate_all(fruit, "\\P{M}")




