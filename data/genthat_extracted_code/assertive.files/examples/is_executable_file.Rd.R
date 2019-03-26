library(assertive.files)


### Name: assert_all_are_executable_files
### Title: Is the file accessible?
### Aliases: assert_all_are_executable_files assert_all_are_readable_files
###   assert_all_are_writable_files assert_any_are_executable_files
###   assert_any_are_readable_files assert_any_are_writable_files
###   is_ex_file is_executable_file is_readable_file is_writable_file

### ** Examples

files <- dir()
is_readable_file(files)
is_writable_file(files, warn_about_windows = FALSE)
is_executable_file(files, warn_about_windows = FALSE)



