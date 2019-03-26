library(sentometrics)


### Name: sentiment_bind
### Title: Bind sentiment objects row-wise
### Aliases: sentiment_bind

### ** Examples

data("usnews", package = "sentometrics")
data("list_lexicons", package = "sentometrics")
data("list_valence_shifters", package = "sentometrics")

l <- sento_lexicons(list_lexicons[c("LM_en", "HENRY_en")])

corp1 <- sento_corpus(corpusdf = usnews[1:200, ])
corp2 <- sento_corpus(corpusdf = usnews[201:450, ])
corp3 <- sento_corpus(corpusdf = usnews[401:700, ])

sent1 <- compute_sentiment(corp1, l, how = "proportionalPol")
sent2 <- compute_sentiment(corp2, l, how = "counts")
sent3 <- compute_sentiment(corp3, l, how = "proportional")

sent <- sentiment_bind(sent1, sent2, sent3)
nrow(sent) # 700




