library(wordnet)


### Name: getLemma
### Title: Get Index Term Lemma
### Aliases: getLemma
### Keywords: attribute

### ** Examples

if(initDict()) {
  filter <- getTermFilter("StartsWithFilter", "car", TRUE)
  terms <- getIndexTerms("NOUN", 5, filter)
  sapply(terms, getLemma)
}



