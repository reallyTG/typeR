library(assertive.reflection)


### Name: assert_is_package_current
### Title: Is the installed version of a package current?
### Aliases: assert_all_are_current_packages
###   assert_any_are_current_packages assert_is_package_current
###   is_package_current

### ** Examples

## No test: 
# This test is marked "dont-test" since it involves a connection to 
# repositories which is potentially long running.
is_package_current(c("assertive.base", "assertive.reflection", "NONEXISTENTPKG"))
## End(No test)



