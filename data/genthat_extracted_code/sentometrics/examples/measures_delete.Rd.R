library(sentometrics)


### Name: measures_delete
### Title: Delete sentiment measures
### Aliases: measures_delete

### ** Examples

data("usnews", package = "sentometrics")
data("list_lexicons", package = "sentometrics")
data("list_valence_shifters", package = "sentometrics")

# construct a sentomeasures object to start with
corpus <- sento_corpus(corpusdf = usnews)
corpusSample <- quanteda::corpus_sample(corpus, size = 500)
l <- sento_lexicons(list_lexicons[c("LM_en", "HENRY_en")], list_valence_shifters[["en"]])
ctr <- ctr_agg(howTime = c("equal_weight", "linear"), by = "year", lag = 3)
sentomeasures <- sento_measures(corpusSample, l, ctr)

# different deletions
del1 <- measures_delete(sentomeasures, c("equal_weight"))
del2 <- measures_delete(sentomeasures, c("linear", "LM_en"))
del3 <- measures_delete(sentomeasures, list(c("linear", "wsj"), c("linear", "economy")))
del4 <- measures_delete(sentomeasures, c("equal_weight", "linear")) # warning




