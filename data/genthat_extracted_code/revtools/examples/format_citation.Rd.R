library(revtools)


### Name: format_citation
### Title: Format a citation
### Aliases: format_citation format_citation.bibliography
###   format_citation.list format_citation.data.frame

### ** Examples

file_location <- system.file(
  "extdata",
  "avian_ecology_bibliography.ris",
  package = "revtools")
x <- read_bibliography(file_location, return_df = FALSE)
format_citation(x[[1]])
format_citation(as.data.frame(x)[1, ]) # same result



