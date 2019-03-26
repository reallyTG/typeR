library(diffr)


### Name: diffr
### Title: Diff 2 files side by side
### Aliases: diffr

### ** Examples

library(diffr)
file1 = tempfile()
writeLines("hello, world!\n", con = file1)
file2 = tempfile()
writeLines(paste0(
"hello world?\nI don't get it\n",
paste0(sample(letters, 65, replace = TRUE), collapse = "")), con = file2)
diffr(file1, file2, before = "f1", after = "f2")



