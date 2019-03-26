library(pkgload)


### Name: dev_meta
### Title: Return devtools metadata environment
### Aliases: dev_meta
### Keywords: internal

### ** Examples

dev_meta("stats") # NULL

if (has_tests()) {
# Load the test package in directory "testLoadHooks"
load_all(pkgtest("testLoadHooks"))

# Get metdata for the package
x <- dev_meta("testLoadHooks")
as.list(x)

# Clean up.
unload("testLoadHooks")
}



