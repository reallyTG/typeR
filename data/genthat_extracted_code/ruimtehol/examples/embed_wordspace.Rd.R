library(ruimtehol)


### Name: embed_wordspace
### Title: Build a Starspace model which calculates word embeddings
### Aliases: embed_wordspace

### ** Examples

library(udpipe)
data(brussels_reviews, package = "udpipe")
x <- subset(brussels_reviews, language == "nl")
x <- strsplit(x$feedback, "\\W")
x <- lapply(x, FUN = function(x) setdiff(x, ""))
x <- sapply(x, FUN = function(x) paste(x, collapse = " "))
x <- tolower(x)

set.seed(123456789)
model <- embed_wordspace(x, early_stopping = 0.9, 
                         dim = 15, ws = 7, epoch = 10, minCount = 5, ngrams = 1,
                         maxTrainTime = 2) ## maxTrainTime only set for CRAN
plot(model)
wordvectors <- as.matrix(model)

mostsimilar <- embedding_similarity(wordvectors, wordvectors["weekend", ])
head(sort(mostsimilar[, 1], decreasing = TRUE), 10)
mostsimilar <- embedding_similarity(wordvectors, wordvectors["vriendelijk", ])
head(sort(mostsimilar[, 1], decreasing = TRUE), 10)
mostsimilar <- embedding_similarity(wordvectors, wordvectors["grote", ])
head(sort(mostsimilar[, 1], decreasing = TRUE), 10)



