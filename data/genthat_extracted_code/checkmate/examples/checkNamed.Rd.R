library(checkmate)


### Name: checkNamed
### Title: Check if an argument is named
### Aliases: checkNamed check_named assertNamed assert_named testNamed
###   test_named

### ** Examples

x = 1:3
testNamed(x, "unnamed")
names(x) = letters[1:3]
testNamed(x, "unique")



