library(checkmate)


### Name: checkEnvironment
### Title: Check if an argument is an environment
### Aliases: checkEnvironment check_environment assertEnvironment
###   assert_environment testEnvironment test_environment
###   expect_environment

### ** Examples

ee = as.environment(list(a = 1))
testEnvironment(ee)
testEnvironment(ee, contains = "a")



