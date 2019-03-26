library(R.utils)


### Name: fileAccess
### Title: Checks the permission of a file or a directory
### Aliases: fileAccess.default fileAccess
### Keywords: IO programming

### ** Examples

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Current directory
# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
path <- "."

# Test for existence
print(fileAccess(path, mode=0))
# Test for execute permission
print(fileAccess(path, mode=1))
# Test for write permission
print(fileAccess(path, mode=2))
# Test for read permission
print(fileAccess(path, mode=4))


# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# A temporary file
# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
pathname <- tempfile()
cat(file=pathname, "Hello world!")

# Test for existence
print(fileAccess(pathname, mode=0))
# Test for execute permission
print(fileAccess(pathname, mode=1))
# Test for write permission
print(fileAccess(pathname, mode=2))
# Test for read permission
print(fileAccess(pathname, mode=4))

file.remove(pathname)


# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# The 'base' package directory
# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
path <- system.file(package="base")

# Test for existence
print(fileAccess(path, mode=0))
# Test for execute permission
print(fileAccess(path, mode=1))
# Test for write permission
print(fileAccess(path, mode=2))
# Test for read permission
print(fileAccess(path, mode=4))


# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# The 'base' package DESCRIPTION file
# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
pathname <- system.file("DESCRIPTION", package="base")

# Test for existence
print(fileAccess(pathname, mode=0))
# Test for execute permission
print(fileAccess(pathname, mode=1))
# Test for write permission
print(fileAccess(pathname, mode=2))
# Test for read permission
print(fileAccess(pathname, mode=4))



