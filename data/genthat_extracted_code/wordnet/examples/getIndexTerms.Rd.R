library(wordnet)


### Name: getIndexTerms
### Title: Get Index Terms
### Aliases: getIndexTerms
### Keywords: file

### ** Examples

if(initDict()) {
  filter <- getTermFilter("StartsWithFilter", "car", TRUE)
  getIndexTerms("NOUN", 5, filter)
}



