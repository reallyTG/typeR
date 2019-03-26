library(sentometrics)


### Name: measures_fill
### Title: Add and fill missing dates
### Aliases: measures_fill

### ** Examples

data("usnews", package = "sentometrics")
data("list_lexicons", package = "sentometrics")
data("list_valence_shifters", package = "sentometrics")

# construct a sentomeasures object to start with
corpus <- sento_corpus(corpusdf = usnews)
corpusSample <- quanteda::corpus_sample(corpus, size = 500)
l <- sento_lexicons(list_lexicons[c("LM_en", "HENRY_en")], list_valence_shifters[["en"]])
ctr <- ctr_agg(howTime = c("equal_weight", "linear"), by = "day", lag = 7, fill = "none")
sentomeasures <- sento_measures(corpusSample, l, ctr)

# fill measures
f1 <- measures_fill(sentomeasures)
f2 <- measures_fill(sentomeasures, fill = "latest")
f3 <- measures_fill(sentomeasures, fill = "zero",
                    dateBefore = get_dates(sentomeasures)[1] - 10,
                    dateAfter = tail(get_dates(sentomeasures), 1) + 15)




