library(revtools)


### Name: revwords
### Title: Load a set of stopwords
### Aliases: revwords

### ** Examples

# import some data
file_location <- system.file(
  "extdata",
  "avian_ecology_bibliography.ris",
  package = "revtools")
x <- read_bibliography(file_location)

# construct a document-term matrix
x_DTM <- make_DTM(x$title,
  stop_words = revwords())
# Note that make_DTM calls revwords by default, so this is technically redundant



