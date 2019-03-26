library(findR)


### Name: findtxt
### Title: Find text files by content with pattern matching
### Aliases: findtxt

### ** Examples

# Find all text files in the package folder that contain the name Einstein
findtxt(path = system.file(package = "findR"), pattern = "Einstein")

# Save results in a data frame and show hits
dt <- findtxt(path = system.file(package = "findR"), pattern = "Einstein", show.results = TRUE)
dt




