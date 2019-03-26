library(checkmate)


### Name: checkDirectoryExists
### Title: Check for existence and access rights of directories
### Aliases: checkDirectoryExists check_directory_exists
###   assertDirectoryExists assert_directory_exists testDirectoryExists
###   test_directory_exists expect_directory_exists checkDirectory
###   assertDirectory assert_directory testDirectory test_directory
###   expect_directory

### ** Examples

# Is R's home directory readable?
testDirectory(R.home(), "r")

# Is R's home directory readable and writable?
testDirectory(R.home(), "rw")



