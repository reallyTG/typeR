library(nat.utils)


### Name: split_path
### Title: Split file path into individual components (optionally including
###   separators)
### Aliases: split_path

### ** Examples

split_path("/a/b/c")
split_path("a/b/c")
parts=split_path("/a/b/c", include.fseps=TRUE)
# join parts back up again
paste(parts, collapse = "")
split_path("a/b//c", include.fseps=TRUE, omit.duplicate.fseps=TRUE)
# Windows style
split_path("C:\\a\\b\\c", fsep="\\")



