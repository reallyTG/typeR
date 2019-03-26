library(wordnet)


### Name: getRelatedSynsets
### Title: Get Related Synsets for a Synset
### Aliases: getRelatedSynsets
### Keywords: file

### ** Examples

if(initDict()) {
  filter <- getTermFilter("ExactMatchFilter", "hot", TRUE)
  terms <- getIndexTerms("ADJECTIVE", 5, filter)
  synsets <- getSynsets(terms[[1]])
  related <- getRelatedSynsets(synsets[[1]], "!")
  sapply(related, getWord)
}



