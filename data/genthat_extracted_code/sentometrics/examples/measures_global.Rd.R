library(sentometrics)


### Name: measures_global
### Title: Merge sentiment measures into multiple weighted global sentiment
###   indices
### Aliases: measures_global

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

# merge into one global sentiment measure, with specified weighting for lexicons and features
global <- measures_global(sentomeasures,
                          lexicons = c(0.40, 0.60),
                          features = c(0.10, -0.20, 0.30, -1),
                          time = 1)




