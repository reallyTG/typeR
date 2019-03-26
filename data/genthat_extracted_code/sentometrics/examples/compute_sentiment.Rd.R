library(sentometrics)


### Name: compute_sentiment
### Title: Compute document-level sentiment across features and lexicons
### Aliases: compute_sentiment

### ** Examples

data("usnews", package = "sentometrics")
data("list_lexicons", package = "sentometrics")
data("list_valence_shifters", package = "sentometrics")

l1 <- sento_lexicons(list_lexicons[c("LM_en", "HENRY_en")])
l2 <- sento_lexicons(list_lexicons[c("LM_en", "HENRY_en")], list_valence_shifters[["en"]])
l3 <- sento_lexicons(list_lexicons[c("LM_en", "HENRY_en")],
                     list_valence_shifters[["en"]][, c("x", "t")])

# from a sentocorpus object, unigrams approach
corpus <- sento_corpus(corpusdf = usnews)
corpusSample <- quanteda::corpus_sample(corpus, size = 200)
sent1 <- compute_sentiment(corpusSample, l1, how = "proportionalPol")

# from a character vector, bigrams approach
sent2 <- compute_sentiment(usnews[["texts"]][1:200], l2, how = "counts")

# from a corpus object, clusters approach
corpusQ <- quanteda::corpus(usnews, text_field = "texts")
corpusQSample <- quanteda::corpus_sample(corpusQ, size = 200)
sent3 <- compute_sentiment(corpusQSample, l3, how = "counts")

# from an already tokenized corpus, using the 'tokens' argument
toks <- as.list(quanteda::tokens(corpusQSample, what = "fastestword"))
sent4 <- compute_sentiment(corpusQSample, l1[1], how = "counts", tokens = toks)




