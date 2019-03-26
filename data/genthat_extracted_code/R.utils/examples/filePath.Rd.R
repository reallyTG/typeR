library(R.utils)


### Name: filePath
### Title: Construct the path to a file from components and expands Windows
###   Shortcuts along the pathname from root to leaf
### Aliases: filePath.default filePath
### Keywords: IO

### ** Examples

# Default
print(file.path("foo", "bar", "..", "name")) # "foo/bar/../name"

# Shorten pathname, if possible
print(filePath("foo", "bar", "..", "name"))  # "foo/name"
print(filePath("foo/bar/../name"))           # "foo/name"

# Recognize Windows Shortcut files along the path, cf. Unix soft links
filename <- system.file("data-ex/HISTORY.LNK", package="R.utils")
print(filename)
filename <- filePath(filename, expandLinks="relative")
print(filename)



