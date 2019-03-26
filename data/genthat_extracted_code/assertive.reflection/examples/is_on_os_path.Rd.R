library(assertive.reflection)


### Name: assert_all_are_on_os_path
### Title: Is the path on the OS path?
### Aliases: assert_all_are_on_os_path assert_any_are_on_os_path
###   is_on_os_path

### ** Examples

is_on_os_path(
  c(R.home("bin"), R.home("etc"), "a nonexistent path")
) # probably c(TRUE, FALSE, FALSE)



