library(assertive.files)


### Name: assert_all_are_empty_files
### Title: Is a file too big or small?
### Aliases: assert_all_are_empty_files assert_all_are_non_empty_files
###   assert_all_file_sizes_are_in_range assert_any_are_empty_files
###   assert_any_are_non_empty_files assert_any_file_sizes_are_in_range
###   is_empty_file is_file_size_in_range is_non_empty_file

### ** Examples

tf <- tempfile()
file.create(tf)
is_empty_file(tf)
cat("some stuff", file = tf)
is_non_empty_file(tf)
assertive.base::dont_stop(assert_all_file_sizes_are_in_range(tf, lower = 100))
unlink(tf)  



