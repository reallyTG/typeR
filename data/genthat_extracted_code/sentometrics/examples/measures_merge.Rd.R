library(sentometrics)


### Name: measures_merge
### Title: Merge sentiment measures
### Aliases: measures_merge

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

# merging across specified components
sentomeasuresMerged <- measures_merge(sentomeasures,
                                      time = list(W = c("equal_weight", "linear")),
                                      features = list(journals = c("wsj", "wapo")),
                                      do.keep = TRUE)

# merging in full
dims <- get_dimensions(sentomeasures)
sentomeasuresFull <- measures_merge(sentomeasures,
                                    lexicons = list(L = dims[["lexicons"]]),
                                    time = list(T = dims[["time"]]),
                                    features = list(F = dims[["features"]]))

## Not run: 
##D # this merging will not work, but produces an informative error message
##D measures_merge(sentomeasures,
##D                time = list(W = c("equal_weight", "almon1")),
##D                lexicons = list(LEX = c("LM_en")),
##D                features = list(journals = c("notInHere", "wapo")))
## End(Not run)



