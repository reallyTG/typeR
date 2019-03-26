library(wordnet)


### Name: getSynsets
### Title: Get Synsets for an Index Term
### Aliases: getSynsets
### Keywords: file

### ** Examples

if(initDict()) {
  filter <- getTermFilter("ExactMatchFilter", "hot", TRUE)
  terms <- getIndexTerms("ADJECTIVE", 5, filter)
  getSynsets(terms[[1]])
}



