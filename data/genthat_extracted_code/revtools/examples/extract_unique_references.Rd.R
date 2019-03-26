library(revtools)


### Name: extract_unique_references
### Title: Create a de-duplicated data.frame
### Aliases: extract_unique_references

### ** Examples

# import data
file_location <- system.file(
  "extdata",
  "avian_ecology_bibliography.ris",
  package = "revtools"
)
x <- read_bibliography(file_location)

# generate duplicated references (for example purposes)
x_duplicated <- rbind(x, x[1:5,])

# locate and extract unique references
x_check <- find_duplicates(x_duplicated)
x_unique <- extract_unique_references(x_duplicated, matches = x_check)



