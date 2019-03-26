library(revtools)


### Name: read_bibliography
### Title: Import bibliographic data
### Aliases: read_bibliography

### ** Examples

  file_location <- system.file(
    "extdata",
    "avian_ecology_bibliography.ris",
    package = "revtools")
x <- read_bibliography(file_location)
class(x) # = data.frame
x <- read_bibliography(file_location, return_df = FALSE)
class(x) # = bibliography
summary(x)



