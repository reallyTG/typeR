library(checkmate)


### Name: checkFileExists
### Title: Check existence and access rights of files
### Aliases: checkFileExists check_file_exists assertFileExists
###   assert_file_exists testFileExists test_file_exists expect_file_exists
###   checkFile assertFile assert_file testFile expect_file

### ** Examples

# Check if R's COPYING file is readable
testFileExists(file.path(R.home(), "COPYING"), access = "r")

# Check if R's COPYING file is readable and writable
testFileExists(file.path(R.home(), "COPYING"), access = "rw")



