library(sentimentr)


### Name: extract_sentiment_terms
### Title: Extract Sentiment Words
### Aliases: extract_sentiment_terms

### ** Examples

library(data.table)
set.seed(10)
x <- get_sentences(sample(hu_liu_cannon_reviews[[2]], 1000, TRUE))
sentiment(x)

pol_words <- extract_sentiment_terms(x)
pol_words
pol_words$sentence
pol_words$neutral
data.table::as.data.table(pol_words)

attributes(extract_sentiment_terms(x))$counts
attributes(extract_sentiment_terms(x))$elements



