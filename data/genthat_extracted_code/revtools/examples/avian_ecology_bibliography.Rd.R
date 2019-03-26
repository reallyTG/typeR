library(revtools)


### Name: avian_ecology_bibliography
### Title: Bibliographic data from 20 papers on avian ecology
### Aliases: avian_ecology_bibliography

### ** Examples

file_location <- system.file(
  "extdata",
  "avian_ecology_bibliography.ris",
  package = "revtools")
x <- read_bibliography(file_location)
summary(x)



