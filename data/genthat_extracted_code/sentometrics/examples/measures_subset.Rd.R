library(sentometrics)


### Name: measures_subset
### Title: Subset sentiment measures
### Aliases: measures_subset

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

# different subsets
sub1 <- measures_subset(sentomeasures, HENRY_en--economy--equal_weight >= 0.01)
sub2 <- measures_subset(sentomeasures,
   date %in% seq(as.Date("2000-01-01"), as.Date("2013-12-01"), by = "month"))




