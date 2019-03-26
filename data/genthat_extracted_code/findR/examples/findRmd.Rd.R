library(findR)


### Name: findRmd
### Title: Find R Markdown files by content with pattern matching
### Aliases: findRmd

### ** Examples

# Find all R Markdown files in the package folder that contain a ggplot bar chart
findRmd(path = system.file(package = "findR"), pattern = "geom_bar")

# Save results in a data frame and show hits
dt <- findRmd(path = system.file(package = "findR"), pattern = "geom_bar", show.results = TRUE)
dt




