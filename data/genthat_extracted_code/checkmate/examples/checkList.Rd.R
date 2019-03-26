library(checkmate)


### Name: checkList
### Title: Check if an argument is a list
### Aliases: checkList check_list assertList assert_list testList test_list
###   expect_list

### ** Examples

testList(list())
testList(as.list(iris), types = c("numeric", "factor"))

# Uniqueness differentiates between different NA types:
testList(list(NA, NA), unique = TRUE)
testList(list(NA, NA_real_), unique = TRUE)



