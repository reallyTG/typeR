library(sentometrics)


### Name: peakdates
### Title: Extract dates related to sentiment time series peaks
### Aliases: peakdates

### ** Examples

set.seed(505)

data("usnews", package = "sentometrics")
data("list_lexicons", package = "sentometrics")
data("list_valence_shifters", package = "sentometrics")

# construct a sentomeasures object to start with
corpus <- sento_corpus(corpusdf = usnews)
corpusSample <- quanteda::corpus_sample(corpus, size = 500)
l <- sento_lexicons(list_lexicons[c("LM_en", "HENRY_en")], list_valence_shifters[["en"]])
ctr <- ctr_agg(howTime = c("equal_weight", "linear"), by = "month", lag = 3)
sentomeasures <- sento_measures(corpusSample, l, ctr)

# extract the peaks
peaksAbs <- peakdates(sentomeasures, n = 5)
peaksAbsQuantile <- peakdates(sentomeasures, n = 0.50)
peaksPos <- peakdates(sentomeasures, n = 5, type = "pos")
peaksNeg <- peakdates(sentomeasures, n = 5, type = "neg")




