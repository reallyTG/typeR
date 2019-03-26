library(sentometrics)


### Name: measures_select
### Title: Select sentiment measures
### Aliases: measures_select

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

# different selections
sel1 <- measures_select(sentomeasures, c("equal_weight"))
sel2 <- measures_select(sentomeasures, c("equal_weight", "linear"))
sel3 <- measures_select(sentomeasures, c("linear", "LM_en"))
sel4 <- measures_select(sentomeasures, list(c("linear", "wsj"), c("linear", "economy")))




