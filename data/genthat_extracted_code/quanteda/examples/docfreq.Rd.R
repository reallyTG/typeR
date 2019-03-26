library(quanteda)


### Name: docfreq
### Title: Compute the (weighted) document frequency of a feature
### Aliases: docfreq
### Keywords: dfm weighting

### ** Examples

mydfm <- dfm(data_corpus_inaugural[1:2])
docfreq(mydfm[, 1:20])

# replication of worked example from
# https://en.wikipedia.org/wiki/Tf-idf#Example_of_tf.E2.80.93idf
wiki_dfm <- 
    matrix(c(1,1,2,1,0,0, 1,1,0,0,2,3),
           byrow = TRUE, nrow = 2,
           dimnames = list(docs = c("document1", "document2"),
                           features = c("this", "is", "a", "sample",
                                        "another", "example"))) %>%
    as.dfm()
wiki_dfm
docfreq(wiki_dfm)
docfreq(wiki_dfm, scheme = "inverse")
docfreq(wiki_dfm, scheme = "inverse", k = 1, smoothing = 1)
docfreq(wiki_dfm, scheme = "unary")
docfreq(wiki_dfm, scheme = "inversemax")
docfreq(wiki_dfm, scheme = "inverseprob")



