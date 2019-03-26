library(checkmate)


### Name: checkNames
### Title: Check names to comply to specific rules
### Aliases: checkNames check_names assertNames assert_names testNames
###   test_names expect_names

### ** Examples

x = 1:3
testNames(x, "unnamed")
names(x) = letters[1:3]
testNames(x, "unique")

cn = c("Species", "Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")
assertNames(names(iris), permutation.of = cn)



