library(revtools)


### Name: run_topic_model
### Title: Calculate a topic model
### Aliases: run_topic_model run_LDA

### ** Examples

# import data
file_location <- system.file(
  "extdata",
  "avian_ecology_bibliography.ris",
  package = "revtools"
)
x <- read_bibliography(file_location)

# run a topic model based on these data
# note: the following lines can take a very long time to run, especially for large datasets!
x_dtm <- make_dtm(x$title)
## Not run: x_lda <- run_topic_model(x_dtm, "lda", 5, 5000)



