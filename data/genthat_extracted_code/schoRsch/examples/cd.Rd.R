library(schoRsch)


### Name: cd
### Title: Change Directory
### Aliases: cd
### Keywords: utilities

### ** Examples

## Create temporary folder
dir.create("a_test_dir")

## Navigate into the new folder...
cd("a_test_dir")
## ... and back again
cd("..")

## Remove temporary folder
unlink("a_test_dir",recursive=TRUE)



