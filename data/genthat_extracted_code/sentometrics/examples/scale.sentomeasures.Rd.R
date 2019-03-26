library(sentometrics)


### Name: scale.sentomeasures
### Title: Scaling and centering of sentiment measures
### Aliases: scale.sentomeasures

### ** Examples

data("usnews", package = "sentometrics")
data("list_lexicons", package = "sentometrics")
data("list_valence_shifters", package = "sentometrics")

set.seed(505)

# construct a sentomeasures object to start with
corpus <- sento_corpus(corpusdf = usnews)
corpusSample <- quanteda::corpus_sample(corpus, size = 500)
l <- sento_lexicons(list_lexicons[c("LM_en", "HENRY_en")], list_valence_shifters[["en"]])
ctr <- ctr_agg(howTime = c("equal_weight", "linear"), by = "year", lag = 3)
sentomeasures <- sento_measures(corpusSample, l, ctr)

# scale sentiment measures to zero mean and unit standard deviation
sc1 <- scale(sentomeasures)

n <- nobs(sentomeasures)
m <- nmeasures(sentomeasures)

# add a matrix
sc2 <- scale(sentomeasures, center = matrix(runif(n * m), n, m), scale = FALSE)

# divide every row observation based on a one-column matrix, then center
sc3 <- scale(sentomeasures, center = TRUE, scale = matrix(runif(n)))




