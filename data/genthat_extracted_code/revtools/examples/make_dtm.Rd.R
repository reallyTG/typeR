library(revtools)


### Name: make_dtm
### Title: Construct a document-term matrix (DTM)
### Aliases: make_dtm make_DTM

### ** Examples

# import some data
file_location <- system.file(
  "extdata",
  "avian_ecology_bibliography.ris",
  package = "revtools")
x <- read_bibliography(file_location)

# construct a document-term matrix
# note: this can take a long time to run for large datasets
x_dtm <- make_dtm(x$title)
dim(x_dtm) # 20 articles, 1069 words



