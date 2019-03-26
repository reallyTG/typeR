library(tidytext)


### Name: tdm_tidiers
### Title: Tidy DocumentTermMatrix, TermDocumentMatrix, and related objects
###   from the tm package
### Aliases: tdm_tidiers tidy.DocumentTermMatrix tidy.TermDocumentMatrix
###   tidy.dfm tidy.dfmSparse tidy.simple_triplet_matrix

### ** Examples


if (requireNamespace("topicmodels", quietly = TRUE)) {
  data("AssociatedPress", package = "topicmodels")
  AssociatedPress

  tidy(AssociatedPress)
}




