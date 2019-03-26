library(checkmate)


### Name: checkFactor
### Title: Check if an argument is a factor
### Aliases: checkFactor check_factor assertFactor assert_factor testFactor
###   test_factor expect_factor

### ** Examples

x = factor("a", levels = c("a", "b"))
testFactor(x)
testFactor(x, empty.levels.ok = FALSE)



