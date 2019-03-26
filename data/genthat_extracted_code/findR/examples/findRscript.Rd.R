library(findR)


### Name: findRscript
### Title: Find R scripts by content with pattern matching
### Aliases: findRscript

### ** Examples

# Find all Rscripts in the package folder that use the circlize package
findRscript(path = system.file(package = "findR"), pattern = "circlize")

# Save results in a data frame and show hits
dt <- findRscript(path = system.file(package = "findR"), pattern = "circlize", show.results = TRUE)
dt




