library(quanteda)


### Name: dfm_tfidf
### Title: Weight a dfm by _tf-idf_
### Aliases: dfm_tfidf
### Keywords: dfm weighting

### ** Examples

mydfm <- as.dfm(data_dfm_lbgexample)
head(mydfm[, 5:10])
head(dfm_tfidf(mydfm)[, 5:10])
docfreq(mydfm)[5:15]
head(dfm_weight(mydfm)[, 5:10])

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
dfm_tfidf(wiki_dfm, scheme_tf = "prop") %>% round(digits = 2)

## Not run: 
##D # comparison with tm
##D if (requireNamespace("tm")) {
##D     convert(wiki_dfm, to = "tm") %>% weightTfIdf() %>% as.matrix()
##D     # same as:
##D     dfm_tfidf(wiki_dfm, base = 2, scheme_tf = "prop")
##D }
## End(Not run)



