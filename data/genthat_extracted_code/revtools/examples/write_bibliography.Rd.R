library(revtools)


### Name: write_bibliography
### Title: Export imported bibliographic data as .bib or .ris formats
### Aliases: write_bibliography

### ** Examples

file_location <- system.file(
  "extdata",
  "avian_ecology_bibliography.ris",
  package = "revtools")
x <- read_bibliography(file_location, return_df = FALSE)

# export a subset of entries as a new file
write_bibliography(x[1:5],
  filename = paste0(tempdir(), "/x_out.ris"),
  format = "ris")



