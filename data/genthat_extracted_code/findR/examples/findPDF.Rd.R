library(findR)


### Name: findPDF
### Title: Find PDF files by content with pattern matching
### Aliases: findPDF

### ** Examples

# Find all PDF files in the package folder that contain the name Hanna
findPDF(path = system.file(package = "findR"), pattern = "Hanna")

# Save results in a data frame and show hits
dt <- findPDF(path = system.file(package = "findR"), pattern = "Hanna", show.results = TRUE)
dt




