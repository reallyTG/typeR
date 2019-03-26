library(checkmate)


### Name: checkChoice
### Title: Check if an object is an element of a given set
### Aliases: checkChoice check_choice assertChoice assert_choice testChoice
###   test_choice expect_choice

### ** Examples

testChoice("x", letters)

# x is not converted before the comparison (except for numerics)
testChoice(factor("a"), "a")
testChoice(1, "1")
testChoice(1, as.integer(1))



