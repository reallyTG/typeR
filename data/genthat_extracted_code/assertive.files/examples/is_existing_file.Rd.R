library(assertive.files)


### Name: assert_all_are_existing_files
### Title: Does the file exist?
### Aliases: assert_all_are_existing_files assert_any_are_existing_files
###   is_existing_file

### ** Examples

assert_all_are_existing_files(dir())
# These examples should fail.
assertive.base::dont_stop(
  assert_all_are_existing_files("not an existing file (probably)")
)



