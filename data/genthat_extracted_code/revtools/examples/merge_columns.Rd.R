library(revtools)


### Name: merge_columns
### Title: rbind two data frames with different columns
### Aliases: merge_columns

### ** Examples

# import some data
file_location <- system.file(
  "extdata",
  "avian_ecology_bibliography.ris",
  package = "revtools")
x <- read_bibliography(file_location)
y <- x[, 1:3]
z <- merge_columns(x, y)



