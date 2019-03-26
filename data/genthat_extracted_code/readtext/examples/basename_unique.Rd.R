library(readtext)


### Name: basename_unique
### Title: Return basenames that are unique
### Aliases: basename_unique
### Keywords: internal

### ** Examples

files <- c("../data/glob/subdir1/test.txt", "../data/glob/subdir2/test.txt")
readtext:::basename_unique(files)
# [1] "subdir1/test.txt" "subdir2/test.txt"
readtext:::basename_unique(files, path_only = TRUE)
# [1] "subdir1" "subdir2"
readtext:::basename_unique(c("../data/test1.txt", "../data/test2.txt"))
# [1] "test1.txt" "test2.txt"



