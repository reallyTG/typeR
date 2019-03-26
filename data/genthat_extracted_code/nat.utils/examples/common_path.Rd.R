library(nat.utils)


### Name: common_path
### Title: Find common prefix of two or more (normalised) file paths
### Aliases: common_path

### ** Examples

common_path(c("/a","/b"))
common_path(c("/a/b/","/a/b"))
common_path(c("/a/b/d","/a/b/c/d"))
common_path(c("/a/b/d","/b/c/d"))
common_path(c("a","b"))
common_path(c("","/a"))
common_path(c("~","~/"))
common_path(c("~/a/b/d","~/a/b/c/d"), normalise = FALSE)
common_path(c("~","~/"), normalise = FALSE)



