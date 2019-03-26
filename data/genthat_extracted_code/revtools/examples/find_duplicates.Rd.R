library(revtools)


### Name: find_duplicates
### Title: Locate duplicated information within a data.frame
### Aliases: find_duplicates

### ** Examples

# import data
file_location <- system.file(
  "extdata",
  "avian_ecology_bibliography.ris",
  package = "revtools")
x <- read_bibliography(file_location)

# generate then locate some 'fake' duplicates
x_duplicated <- rbind(x, x[1:5,])
x_check <- find_duplicates(x_duplicated)
# returns a vector of potential matches



