library(checkmate)


### Name: checkSubset
### Title: Check if an argument is a subset of a given set
### Aliases: checkSubset check_subset assertSubset assert_subset testSubset
###   test_subset expect_subset

### ** Examples

testSubset(c("a", "z"), letters)
testSubset("ab", letters)
testSubset("Species", names(iris))

# x is not converted before the comparison (except for numerics)
testSubset(factor("a"), "a")
testSubset(1, "1")
testSubset(1, as.integer(1))



