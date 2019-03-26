library(quanteda)


### Name: corpus_sample
### Title: Randomly sample documents from a corpus
### Aliases: corpus_sample
### Keywords: corpus

### ** Examples

# sampling from a corpus
summary(corpus_sample(data_corpus_inaugural, 5)) 
summary(corpus_sample(data_corpus_inaugural, 10, replace = TRUE))

# sampling sentences within document
doccorpus <- corpus(c(one = "Sentence one.  Sentence two.  Third sentence.",
                      two = "First sentence, doc2.  Second sentence, doc2."))
sentcorpus <- corpus_reshape(doccorpus, to = "sentences")
texts(sentcorpus)
texts(corpus_sample(sentcorpus, replace = TRUE, by = "document"))



