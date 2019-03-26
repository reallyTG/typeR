library(wordnet)


### Name: getSynonyms
### Title: Get Synonyms for an Index Term
### Aliases: getSynonyms
### Keywords: file

### ** Examples

if(initDict()) {
  filter <- getTermFilter("ExactMatchFilter", "company", TRUE)
  terms <- getIndexTerms("NOUN", 5, filter)
  getSynonyms(terms[[1]])
}



