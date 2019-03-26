library(mmapcharr)


### Name: mmapchar-class
### Title: Class mmapchar
### Aliases: mmapchar-class mmapchar_RC mmapchar

### ** Examples

test_file <- system.file("testdata/test-windows.txt", package = "mmapcharr")
test <- mmapchar(test_file, code = mmapcharr:::CODE_012)
test[, 1:3]
test[]
readLines(test_file)




