library(checkmate)


### Name: checkSetEqual
### Title: Check if an argument is equal to a given set
### Aliases: checkSetEqual check_set_equal assertSetEqual assert_set_equal
###   testSetEqual test_set_equal expect_set_equal

### ** Examples

testSetEqual(c("a", "b"), c("a", "b"))
testSetEqual(1:3, 1:4)

# x is not converted before the comparison (except for numerics)
testSetEqual(factor("a"), "a")
testSetEqual(1, "1")
testSetEqual(1, as.integer(1))



