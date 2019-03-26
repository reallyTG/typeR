library(withr)


### Name: with_file
### Title: Files which delete themselves
### Aliases: with_file local_file

### ** Examples

with_file("file1", {
  writeLines("foo", "file1")
  readLines("file1")
})

with_file(list("file1" = writeLines("foo", "file1")), {
  readLines("file1")
})



