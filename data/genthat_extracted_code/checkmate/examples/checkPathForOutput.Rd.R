library(checkmate)


### Name: checkPathForOutput
### Title: Check if a path is suited for creating an output file
### Aliases: checkPathForOutput check_path_for_output assertPathForOutput
###   assert_path_for_output testPathForOutput test_path_for_output
###   expect_path_for_output

### ** Examples

# Can we create a file in the tempdir?
testPathForOutput(file.path(tempdir(), "process.log"))



