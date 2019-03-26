library(R.utils)


### Name: getRelativePath
### Title: Gets the relative pathname relative to a directory
### Aliases: getRelativePath.default getRelativePath
### Keywords: IO programming

### ** Examples

  getRelativePath("foo", "foo")                       # "."
  getRelativePath("foo/bar", "foo")                   # "bar"
  getRelativePath("foo/bar", "foo/bar/yah")           # ".."
  getRelativePath("foo/bar/cool", "foo/bar/yah/sub/") # "../../cool"
  getRelativePath("/tmp/bar/", "/bar/foo/")           # "../../tmp/bar"

  # Windows
  getRelativePath("C:/foo/bar/", "C:/bar/")           # "../foo/bar"
  getRelativePath("C:/foo/bar/", "D:/bar/")           # "C:/foo/bar"



