library(checkmate)


### Name: checkAccess
### Title: Check file system access rights
### Aliases: checkAccess check_access assertAccess assert_access testAccess
###   test_access expect_access

### ** Examples

# Is R's home directory readable?
testAccess(R.home(), "r")

# Is R's home directory writeable?
testAccess(R.home(), "w")



